//
//  MovieDetailScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/6/25.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
  
  @Environment(AppServices.self) private var appServices
  let movie: Movie
  
  @State private var title: String = ""
  @State private var year: Int?
    var body: some View {
      Form {
        TextField("Title", text: $title)
        TextField("Year", value: $year, format: .number)
        Button("Udpate") {
          appServices.movieStore.updateMovie(movie: movie, title: title, year: year)
        }
        .buttonStyle(.borderless)
      }.onAppear {
       title = movie.title
        year = movie.year
      }
    }
}

#Preview {
let appServices = AppServices(modelContainer: PreviewContainer.shared)
  NavigationStack {
    MovieDetailScreen(movie: Movie.example.first!)
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appServices)
}
