//
//  Review.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI
import SwiftData




typealias Review = CineBaySchemaV3.Review
//@Model
//final class Review {
//  var subject: String
//  var body : String
//  var movie: Movie 
//  
//  
//  init(subject: String, body: String, movie: Movie) {
//    self.subject = subject
//    self.body = body
//    self.movie = movie
//  }
//}

extension Review {
  static var example: [Review] {
    [
      Review(subject: "Subject 1", body: "Body 1", movie: Movie.example[0]),
      Review(subject: "Subject 2", body: "Body 2", movie: Movie.example[1]),
      Review(subject: "Subject 3", body: "Body 3", movie: Movie.example[2])
    ]
  }
}
