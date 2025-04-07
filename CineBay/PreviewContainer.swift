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
                  Movie(title: "Inception", year: 2010),
                  Movie(title: "The Dark Knight", year: 2008),
                  Movie(title: "Interstellar", year: 2014),
                  Movie(title: "Parasite", year: 2019),
                  Movie(title: "Spirited Away", year: 2001),
                  Movie(title: "Mad Max: Fury Road", year: 2015)
              ]
    
      for movie in sampleMovies {
          context.insert(movie)
      }
    print("PreviewContainer: Sample data insertion complete.")
  }
}
