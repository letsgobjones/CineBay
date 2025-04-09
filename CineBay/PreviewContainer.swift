//
//  PreviewContainer.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData

@MainActor
struct PreviewContainer {
  static var shared: ModelContainer = {
    let schema = Schema([
      Movie.self, Review.self, Actor.self
    ])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
    do {
      print("Creating Preview ModelContainer...")
      let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
      print("Preview ModelContainer created successfully.")
      
      // Insert sample data asynchronously AFTER container creation
      // Use Task to avoid blocking the static initializer
      Task { @MainActor in
        print("PreviewContainer: Task starting to insert sample data...")
        await PreviewContainer.insertSampleData(context: container.mainContext)
        print("PreviewContainer: Task finished inserting sample data.")
      }
      return container
    } catch {
      fatalError("Could not create ModelContainer: \(error)")
    }
  }() // Immediately execute the closure
}


@MainActor
extension PreviewContainer {
  static func insertSampleData(context: ModelContext) async {
    print("PreviewContainer: Inserting mock data via extension...")
    
    let sampleMovies = [
      Movie(name: "Oppenheimer", year: 2023),
      Movie(name: "Everything Everywhere All at Once", year: 2022),
      Movie(name: "Dune", year: 2021),
      Movie(name: "Nomadland", year: 2020),
      Movie(name: "Avengers: Endgame", year: 2019),
      Movie(name: "Black Panther", year: 2018)
    ]
    
    for movie in sampleMovies {
      context.insert(movie)
    }
    
    // Create and insert sample actors
    let sampleActors = [
      Actor(name: "Cillian Murphy"),
      Actor(name: "Michelle Yeoh"),
      Actor(name: "Timothée Chalamet"),
      Actor(name: "Frances McDormand"),
      Actor(name: "Robert Downey Jr."),
      Actor(name: "Chadwick Boseman")
    ]
    
    for actor in sampleActors {
      context.insert(actor)
    }
    
    // Create and insert sample reviews, linking them to movies
    let sampleReviews = [
      Review(subject: "Great Acting", body: "Cillian Murphy delivers a powerful and nuanced performance.", movie: sampleMovies[0]), // Oppenheimer
      Review(subject: "Mind-Bending", body: "A visually stunning and thought-provoking film.", movie: sampleMovies[0]),
      Review(subject: "Incredible and Unique", body: "Michelle Yeoh is phenomenal in this genre-bending masterpiece.", movie: sampleMovies[1]), // Everything Everywhere...
      Review(subject: "Visually Stunning", body: "The world-building and special effects are breathtaking.", movie: sampleMovies[2]), // Dune
      Review(subject: "Poignant and Beautiful", body: "A moving and understated exploration of grief and resilience.", movie: sampleMovies[3]), // Nomadland
      Review(subject: "Epic Conclusion", body: "A satisfying and emotional end to a decade-long saga.", movie: sampleMovies[4]), // Avengers: Endgame
      Review(subject: "Culturally Significant", body: "A groundbreaking film with a powerful message.", movie: sampleMovies[5])  // Black Panther
    ]
    
    for review in sampleReviews {
      context.insert(review)
    }
    
    // Establish relationships between movies and actors (example)
    sampleMovies[0].actors = [sampleActors[0]] // Oppenheimer - Cillian Murphy
    sampleMovies[1].actors = [sampleActors[1]] // Everything Everywhere... - Michelle Yeoh
    sampleMovies[2].actors = [sampleActors[2]] // Dune - Timothée Chalamet
    sampleMovies[3].actors = [sampleActors[3]] // Nomadland - Frances McDormand
    sampleMovies[4].actors = [sampleActors[4], sampleActors[5]] // Avengers: Endgame - RDJ, CB
    sampleMovies[5].actors =  [sampleActors[5]] // CB
    print("PreviewContainer: Sample data insertion complete.")
  }
}
