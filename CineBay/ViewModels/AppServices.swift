//
//  AppServices.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//



import SwiftUI
import SwiftData


@MainActor
@Observable
final class AppServices {
  
  let movieStore: MovieStore
  let reviewStore: ReviewStore
  
  
  // Initializer takes the ModelContainer to get the context
  init(modelContainer: ModelContainer) {
    // Get the main context from the container
    let modelContext = modelContainer.mainContext
    
    // Initialize the contained stores/services, passing the context they need
    self.movieStore = MovieStore(modelContext: modelContext)
    self.reviewStore = ReviewStore(modelContext: modelContext)
    
    
    print("AppServices Initialized")
  }
}
