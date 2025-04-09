//
//  MovieSelectionView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI
import SwiftData

struct MovieSelectionView: View {
  @Environment(AppManager.self) private var appManager
  
  @Query(sort: \Movie.name, order: .forward) private var movies: [Movie]
  
  @Binding var selectedMovies: Set<Movie>
  
    var body: some View {
      List(movies) { movie in
        HStack {
          Image(systemName: selectedMovies.contains(movie) ? "checkmark.square" :"square")
            .onTapGesture {
              if !selectedMovies.contains(movie) {
               selectedMovies.insert(movie)
              } else {
                selectedMovies.remove(movie)
              }
              
            }
          Text(movie.name)
        }
        
      }
    }
}

#Preview {
  let context = PreviewContainer.shared.mainContext
  let appManager = AppManager(modelContainer: PreviewContainer.shared)
  
  for movie in Movie.example {
    context.insert(movie)
  }
  try! context.save()
  
  return NavigationStack {
    MovieSelectionView(selectedMovies: .constant(Set<Movie>()))
  }
  .environment(appManager)
  .modelContainer(PreviewContainer.shared)
}
