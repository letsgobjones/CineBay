//
//  AppManager.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//



import SwiftUI
import SwiftData


@MainActor
@Observable
final class AppManager {
  
  let movieStore: MovieStore
  let reviewStore: ReviewStore
  let actorStore: ActorStore
  
  // Initializer takes the ModelContainer to get the context
  init(modelContainer: ModelContainer) {
    // Get the main context from the container
    let modelContext = modelContainer.mainContext
    
    // Initialize the contained stores/services, passing the context they need
    self.movieStore = MovieStore(modelContext: modelContext)
    self.reviewStore = ReviewStore(modelContext: modelContext)
    self.actorStore = ActorStore(modelContext: modelContext)
    
    print("AppManager Initialized")
  }
}
