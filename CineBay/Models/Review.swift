//
//  Review.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI
import SwiftData


@Model
final class Review {
  var subject: String
  var body : String
  var movie: Movie?
  
  
  init(subject: String, body: String, movie: Movie? = nil) {
    self.subject = subject
    self.body = body
    self.movie = movie
  }
}
