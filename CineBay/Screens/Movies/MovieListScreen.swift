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
//  @Query(filter: #Predicate<Actor> { $0.actor.count > 2 }) private var movies : [Movie]
  @Query(sort :\Actor.name, order: .forward) private var actors: [Actor]
  
  @State private var activeSheet: ActiveSheet?
  @State private var filterOption: FilterOption = .none
  var body: some View {
    VStack(alignment: .leading) {
      HStack(alignment: .firstTextBaseline) {
        Text("Movies")
          .font(.largeTitle)
        Spacer()
        Button("Filter") {
          activeSheet = .showFilter
        }
      }
      MovieListView(movies: movies)
      
      Text("Actors")
        .font(.largeTitle)
      ActorListView(actors: actors)
    }
    .padding()
      .toolbar {
        ActionToolbar(leadingActionLabel: "Add Actor", trailingActionLabel: "Add Movie", onLeadingAction: { activeSheet = .addActor }, onTrailingAction: { activeSheet = .addMovie }, isTrailingActionDisabled: false)
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
          
          
        case .showFilter:
          NavigationStack {
           FilterSelectionScreen(filterOption: $filterOption)
         
          }
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


