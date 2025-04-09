//
//  CineBaySchemaVersions.swift
//  CineBay
//
//  Created by Brandon Jones on 4/10/25.
//

import Foundation
import SwiftData

enum CineBaySchemaV1: VersionedSchema {
  static var versionIdentifier: Schema.Version { Schema.Version(1,0,0) }
  
  static var models: [any PersistentModel.Type] {
    [Movie.self]
  }
  
  @Model
  final class Movie {
    
    var title: String
    var year: Int
    
    var reviewsCount: Int {
      reviews.count
    }
    
    var actorsCount: Int {
      actors.count
    }
    
    @Relationship(deleteRule: .cascade, inverse: \Review.movie)
    var reviews:[Review] = []
    
    @Relationship(deleteRule: .nullify, inverse: \Actor.movies)
    var actors: [Actor] = []
    
    init(title: String, year: Int) {
      self.title = title
      self.year = year
    }
  }
}


enum CineBaySchemaV2: VersionedSchema {
  static var versionIdentifier: Schema.Version { Schema.Version(2,0,0) }
  
  static var models: [any PersistentModel.Type] {
    [Movie.self]
  }
  
  @Model
  final class Movie {
    
    @Attribute(.unique) var title: String
    var year: Int
    
    var reviewsCount: Int {
      reviews.count
    }
    
    var actorsCount: Int {
      actors.count
    }
    
    @Relationship(deleteRule: .cascade, inverse: \Review.movie)
    var reviews:[Review] = []
    
    @Relationship(deleteRule: .nullify, inverse: \Actor.movies)
    var actors: [Actor] = []
    
    init(title: String, year: Int) {
      self.title = title
      self.year = year
    }
  }
}
