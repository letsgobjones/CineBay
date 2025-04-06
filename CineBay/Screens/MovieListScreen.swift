//
//  MovieListScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData



struct MovieListScreen: View {
  @Environment(MovieStore.self) private var movieStore
  
  
  @Query(sort: \Movie.title, order: .forward) private var movies: [Movie]
  @State private var isAddMovieSheetPresented = false
  
    var body: some View {
      MovieListView(movies: movies)
        .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Movie") {
           isAddMovieSheetPresented = true
          }
          }
        }
      .sheet(isPresented: $isAddMovieSheetPresented) {
        NavigationStack {
          AddMovieScreen()
        }
      }
      }
    }


#Preview {
  let movieStore = MovieStore(modelContext: PreviewContainer.shared.mainContext)
  NavigationStack {
    MovieListScreen()
  }
  .environment(movieStore)
      .modelContainer(PreviewContainer.shared)
  }

