//
//  ReviewStore.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI
import SwiftData


final class ReviewStore {
  
  private var modelContext: ModelContext
  
  init(modelContext: ModelContext) {
    self.modelContext = modelContext
    print("MovieStore Initialized with context")
    
  }
    
  func addReview(subject: String, body: String, movie: Movie) {
    let review = Review(subject: subject, body: body)
    review.movie = movie
    modelContext.insert(review)
    saveReview()
  }
  
  func saveReview() {
    print("Attempting to save changes...")
    do {
      try modelContext.save()
      print("Changes saved successfully.")
    } catch {
      print("Failed to save changes: \(error.localizedDescription)")
    }
  }
}



