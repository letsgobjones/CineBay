//
//  Actor.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI
import SwiftData


@Model
final class Actor {
  var name: String
  var movies: [Movie]?
  
  init(name: String) {
    self.name = name
  }
}


extension Actor {
  static var example: [Actor] {
    [
      Actor(name: "Actor 1"),
      Actor(name: "Actor 2"),
    ]
  }
}
