//
//  CineBayMigrationPlan.swift
//  CineBay
//
//  Created by Brandon Jones on 4/10/25.
//

import SwiftUI
import SwiftData


enum CineBayMigrationPlan: SchemaMigrationPlan {
  
  static var schemas: [any VersionedSchema.Type] {
    [CineBaySchemaV1.self, CineBaySchemaV2.self]
  }
  
  static var stages: [MigrationStage] {
    [createMigrationStage()] // Ensure the migration stage is included in the stages array
  }
  
  private static func createMigrationStage() -> MigrationStage {
    
    return MigrationStage.custom(
      fromVersion: CineBaySchemaV1.self,
      toVersion: CineBaySchemaV2.self,
      willMigrate: {
        context in
        // 1. Fetch movies from the source schema (V1)
        guard let movies = try? context.fetch(FetchDescriptor<CineBaySchemaV1.Movie>()) else { return }
        
        // 2. Initialize sets to track duplicates and unique titles
        var duplicates = Set<CineBaySchemaV1.Movie>()
        var uniqueSet = Set<String>()
        
        // 3. Identify duplicate movies based on title
        for movie in movies {
          let (wasInserted, _) = uniqueSet.insert(movie.title)
          if !wasInserted {
            duplicates.insert(movie)
          }
        }
        
        // 4. Modify duplicate movie titles to ensure uniqueness in the target schema (V2)
        for duplicateMovie in duplicates {
          // Fetch the movie to be updated, scoping the fetch to the source schema
          if let movieToBeUpdated = try? context.fetch(FetchDescriptor<CineBaySchemaV1.Movie>(predicate: #Predicate { $0.id == duplicateMovie.id })).first {
            movieToBeUpdated.title = "\(movieToBeUpdated.title) (Duplicate - \(UUID().uuidString.prefix(8)))"
          }
        }
        
        try? context.save()
        
      }, didMigrate: nil)
  }
}

//willMirgrate = will give you the opportunity to do something before the migration
//didMigrate = will give you the opportunity to do something after the migration
