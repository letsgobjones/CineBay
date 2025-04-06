//
//  MovieListView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/6/25.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
  
  @Environment(MovieStore.self) private var movieStore
    var movies: [Movie]

 
  
  
  
  
    var body: some View {
      List {
        ForEach(movies) { movie in
          HStack {
            Text(movie.title)
            Spacer()
            Text(movie.year.description)
          }
        }.onDelete { indexSet in movieStore.deleteMovie(at: indexSet, movies: movies)
          
        }
        
      }
    }
}





#Preview {
  let movieStore = MovieStore(modelContext: PreviewContainer.shared.mainContext)
  
  NavigationStack {
    MovieListView(movies: Movie.example)
  }
  .environment(movieStore)
      .modelContainer(PreviewContainer.shared)
}
