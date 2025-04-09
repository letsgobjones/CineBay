//
//  Movie.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData

typealias Movie = CineBaySchemaV3.Movie

extension Movie {
  static var example: [Movie] {
    [
      Movie(name: "Example Movie 1", year: 2021),
      Movie(name: "Example Movie 2", year: 2022),
      Movie(name: "Example Movie 3", year: 2023)
    ]
  }
}
