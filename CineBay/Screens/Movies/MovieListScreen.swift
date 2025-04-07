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
  @Query(sort :\Actor.name, order: .forward) private var actors: [Actor]
  
  @State private var activeSheet: ActiveSheet?
  
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Movies")
        .font(.largeTitle)
      MovieListView(movies: movies)
      
      Text("Actors")
        .font(.largeTitle)
      ActorListView(actors: actors)
    }
    .padding()
      .toolbar {
       MovieListToolbar(onAddActor: { activeSheet = .addActor }, onAddMovie: { activeSheet = .addMovie })
      }
      .sheet(item: $activeSheet) { item in
        switch item {
        case .addMovie:
          NavigationStack {
            AddMovieScreen()
          }
          
        case .addActor:
          NavigationStack {
            AddActorScreen()
          }
          .presentationDetents([.fraction(0.25)])
        }
      }
    // Explicitly pass the received appServices down into the sheet's environment
      .environment(appManager)
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
