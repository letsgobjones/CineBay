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
  
  
  
  init(title: String, year: Int) {
    self.title = title
    self.year = year
  }
  
}
