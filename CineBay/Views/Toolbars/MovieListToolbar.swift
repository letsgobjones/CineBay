//
//  MovieListToolbar.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI

struct MovieListToolbar: ToolbarContent {
  // Define closures for the actions needed by the buttons
  let onAddActor: () -> Void
  let onAddMovie: () -> Void
  
  var body: some ToolbarContent {
    
    ToolbarItem(placement: .topBarLeading) {
      Button("Add Actor") {
        onAddActor()
      }
    }
    ToolbarItem(placement: .topBarTrailing) {
      Button("Add Movie") {
        onAddMovie()
      }
    }
  }
}

#Preview {
  NavigationStack {
    Color.clear
      .toolbar {
        MovieListToolbar(onAddActor: {}, onAddMovie: {})
      }
  }
}
