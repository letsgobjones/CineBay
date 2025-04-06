//
//  CineBayApp.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData

@main
struct CineBayApp: App {
  
  // 1. Define the persistent ModelContainer (SHARED INSTANCE)
  var sharedModelContainer: ModelContainer = {
    let schema = Schema([
      Movie.self, Review.self
    ])
    
    // Configure for persistent storage (on-disk)
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    
    do {
      return try ModelContainer(for: schema, configurations: [modelConfiguration])
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }()// Immediately execute the closure
  
  // 2. Create the AppServices container instance as State
  @State private var appServices: AppServices
  
  // 3. Custom init to initialize @State object BEFORE body access
  init() {
    print("CineApp init() called...")
    // Initialize AppServices state object, passing the shared ModelContainer
    _appServices = State(initialValue: AppServices(modelContainer: sharedModelContainer))
    print("CineBayApp init finished.")
  }
  
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        MovieListScreen()
      }
      // 4. Inject the AppServices instance
      .environment(appServices)
    }
    // 5. Inject the ModelContainer (needed for @Query, @Environment(\.modelContext))
    .modelContainer(sharedModelContainer)
  }
}
