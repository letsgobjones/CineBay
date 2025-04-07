//
//  MovieListScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData



struct MovieListScreen: View {
  @Environment(AppManager.self) private var appManager
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
        // Explicitly pass the received appServices down into the sheet's environment
                        .environment(appManager)
      }
      }
    }


#Preview {
  let appManager = AppManager(modelContainer: PreviewContainer.shared)
  NavigationStack {
    MovieListScreen()
    
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appManager)
  }

