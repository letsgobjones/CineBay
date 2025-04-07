//
//  MovieListView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/6/25.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
 @Environment(AppManager.self) private var appManager
  var movies: [Movie]
  
  var body: some View {
    List {
      ForEach(movies) { movie in
        NavigationLink(value: movie) {
          MovieListCellView(movie: movie)
        }
      }.onDelete { indexSet in appManager.movieStore.deleteMovie(at: indexSet, movies: movies)
      }
    }.navigationDestination(for: Movie.self) { movie in
      MovieDetailScreen(movie: movie)
    }
  }
}





#Preview {
 let appManager = AppManager(modelContainer: PreviewContainer.shared)
  
  NavigationStack {
    MovieListView(movies: Movie.example)
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appManager)
}
