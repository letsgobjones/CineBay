//
//  Movie.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData

@Model
final class Movie {
  var title: String
  var year: Int
  
  @Relationship(deleteRule: .cascade, inverse: \Review.movie) 
  var reviews:[Review]? = []
  
  @Relationship(deleteRule: .noAction, inverse: \Actor.movies)
  var actors: [Actor]? = []
  
  
  
  init(title: String, year: Int) {
    self.title = title
    self.year = year
  }
  
}

extension Movie {
  static var example: [Movie] {
    [
      Movie(title: "Example Movie 1", year: 2021),
      Movie(title: "Example Movie 2", year: 2022),
      Movie(title: "Example Movie 3", year: 2023)
    ]
  }
}
