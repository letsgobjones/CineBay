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
            Movie.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true)
        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
          
          Task {
            PreviewContainer.insertSampleData(context: container.mainContext)
          }
          
          
            return container
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
}


@MainActor
extension PreviewContainer {
  static func insertSampleData(context: ModelContext) {
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
