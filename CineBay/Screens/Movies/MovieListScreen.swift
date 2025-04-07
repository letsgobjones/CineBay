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
  
  @State private var activeSheet: ActiveSheet?
  
  
  var body: some View {
    MovieListView(movies: movies)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Add Actor") {
            activeSheet = .addActor
          }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Movie") {
            activeSheet = .addMovie
          }
        }
      }
      .sheet(item: $activeSheet) { item in
        
        switch item {
        case .addMovie:
          NavigationStack {
            AddMovieScreen()
          }
          // Explicitly pass the received appServices down into the sheet's environment
          .environment(appManager)
          
        case .addActor:
          NavigationStack {
            AddActorScreen()
             
          }
          .presentationDetents([.fraction(0.25)])
          .environment(appManager)
        }
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


extension MovieListScreen {
  enum ActiveSheet: Identifiable {
    case addMovie
    case addActor
    
    var id: Self { self }
  }
}
