//
//  MovieDetailScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/6/25.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
  let movie: Movie
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
