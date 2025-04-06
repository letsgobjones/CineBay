//
//  MovieDetailScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/6/25.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
  
  @Environment(MovieStore.self) private var movieStore
  let movie: Movie
  
  @State private var title: String = ""
  @State private var year: Int?
    var body: some View {
      Form {
        TextField("Title", text: $title)
        TextField("Year", value: $year, format: .number)
        Button("Udpate") {
          guard let year = year else { return }
          movie.title = title
          movie.year = year
          movieStore.saveChanges()
        }
        .buttonStyle(.borderless)
      }.onAppear {
       title = movie.title
        year = movie.year
      }
    }
}

#Preview {
  let movieStore = MovieStore(modelContext: PreviewContainer.shared.mainContext)
  NavigationStack {
    MovieDetailScreen(movie: Movie.example.first!)
  }
  .modelContainer(PreviewContainer.shared)
  .environment(movieStore)
}
