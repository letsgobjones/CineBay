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
  @Query private var movies: [Movie]

    var body: some View {
      List {
        ForEach(movies) { movie in
          HStack {
            Text(movie.title)
            Spacer()
            Text(movie.year.description)
          }
        }
        
      }
    }
}





#Preview {
  let movieStore = MovieStore(modelContext: PreviewContainer.shared.mainContext)
  
  NavigationStack {
    MovieListView()
  }
  .environment(movieStore)
      .modelContainer(PreviewContainer.shared)
}
