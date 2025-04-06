//
//  MovieStore.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData

@MainActor
@Observable
final class MovieStore {
  
  private var modelContext: ModelContext
  
  init(modelContext: ModelContext) {
    self.modelContext = modelContext
  }
  
  
  func addMovie(title: String, year: Int) {
    let newMovie = Movie(title: title, year: year)
    print("Adding movie \(title) - \(year)")
    modelContext.insert(newMovie)
    saveChanges()
  }
  
  func saveChanges(){
    print("Attempting to save changes...")
    do {
      try modelContext.save()
      print("Changes saved successfully.")
    } catch {
      print("Failed to save changes: \(error.localizedDescription)")
    }
  }
  
  
  func deleteMovie(at indexSet: IndexSet, movies: [Movie]) {
    indexSet.forEach { index in
    let movie = movies[index]
      modelContext.delete(movie)
      saveChanges()
    }
  }
  
  
  
}
