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
  
  let filterOption: MovieFilterOption
  //NOTE extract this out to an extension
  init(filterOption: MovieFilterOption = .none) {
    self.filterOption = filterOption
    
    _movies = Query(filter: Self.createPredicate(for: filterOption))
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


extension MovieListView {
  static func createPredicate(for filterOption: MovieFilterOption) -> Predicate<Movie>? {
    switch filterOption {
    case .none:
      return nil
      
    case .titleContains(let movieTitle):
      return #Predicate<Movie> { $0.title.localizedStandardContains(movieTitle) }

    case .reviewCount(let numberOfReviews):
      return #Predicate<Movie> { $0.reviews.count >= numberOfReviews }
    }
  }
}
