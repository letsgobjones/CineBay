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
  
  @Query private var movies: [Movie]
  
  let filterOption: FilterOption
  
  init(filterOption: FilterOption = .none) {
    self.filterOption = filterOption
    
    switch self.filterOption {
    case .title(let movieTitle):
      _movies = Query (filter: #Predicate<Movie> { $0.title.localizedStandardContains(movieTitle) })
    case .none:
      _movies =  Query()
    }
  }
  
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
//    MovieListView(movies: Movie.example)
    MovieListView(filterOption: .none)
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appManager)
}
