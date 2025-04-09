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
    // Add all three models into Schema
            [Movie.self, Review.self, Actor.self]
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
  
  @Model
  final class Review {
    var subject: String
    var body : String
    var movie: Movie
    
    
    init(subject: String, body: String, movie: Movie) {
      self.subject = subject
      self.body = body
      self.movie = movie
    }
  }
  
  @Model
  final class Actor {
    var name: String
    var movies: [Movie] = []
    
    init(name: String) {
      self.name = name
    }
  }
}


enum CineBaySchemaV2: VersionedSchema {
  //Adding unique constraint to movie name
  static var versionIdentifier: Schema.Version { Schema.Version(2,0,0) }
  
  static var models: [any PersistentModel.Type] {
    // Add all three models into Schema
            [Movie.self, Review.self, Actor.self]
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
  
  @Model
  final class Review {
    var subject: String
    var body : String
    var movie: Movie
    
    
    init(subject: String, body: String, movie: Movie) {
      self.subject = subject
      self.body = body
      self.movie = movie
    }
  }
  
  @Model
  final class Actor {
    var name: String
    var movies: [Movie] = []
    
    init(name: String) {
      self.name = name
    }
  }
  
}


enum CineBaySchemaV3: VersionedSchema {
  //CHanging title of movie to name property
  static var versionIdentifier: Schema.Version { Schema.Version(3,0,0) }
  
  static var models: [any PersistentModel.Type] {
    // Add all three models into Schema
            [Movie.self, Review.self, Actor.self]
  }
  
  @Model
  final class Movie {
    
    @Attribute(.unique, originalName: "title") var name: String
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
    
    init(name: String, year: Int) {
      self.name = name
      self.year = year
    }
  }
  
  @Model
  final class Review {
    var subject: String
    var body : String
    var movie: Movie
    
    
    init(subject: String, body: String, movie: Movie) {
      self.subject = subject
      self.body = body
      self.movie = movie
    }
  }
  
  @Model
  final class Actor {
    var name: String
    var movies: [Movie] = []
    
    init(name: String) {
      self.name = name
    }
  }
  
}
