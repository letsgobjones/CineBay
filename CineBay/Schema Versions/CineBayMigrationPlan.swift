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
    [CineBaySchemaV1.self, CineBaySchemaV2.self, CineBaySchemaV3.self]
  }
  
  static var stages: [MigrationStage] {
    [createMigrationStageV1toV2(), createMigrationStageV2toV3()] // Ensure the migration stage is included in the stages array
  }
  
  private static func createMigrationStageV1toV2() -> MigrationStage {
    
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
         let movieId = duplicateMovie.id // Store the id
          
          let fetchDescriptor = FetchDescriptor<CineBaySchemaV1.Movie>(predicate: #Predicate { movie in
            movie.id == movieId // Compare to the stored id
          })
          if let movieToBeUpdated = try? context.fetch(fetchDescriptor).first {
            movieToBeUpdated.title = "\(movieToBeUpdated.title) (Duplicate - \(UUID().uuidString.prefix(8)))"
          }
        }
        
        try? context.save()
        
      }, didMigrate: nil)
  }
  
  private static func createMigrationStageV2toV3() -> MigrationStage {
    return MigrationStage.lightweight(fromVersion: CineBaySchemaV2.self, toVersion: CineBaySchemaV3.self)
  }
  
  
}

//willMirgrate = will give you the opportunity to do something before the migration
//didMigrate = will give you the opportunity to do something after the migration
