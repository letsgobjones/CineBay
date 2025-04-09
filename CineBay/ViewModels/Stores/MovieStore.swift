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
    print("MovieStore Initialized with context")
  }
  
  func addMovie(title: String, year: Int?, selectedActors: Set<Actor>) {
    guard let year = year else {
      print("Addition cancelled: Year is nil")
      return
    }
    let movie = Movie(name: title, year: year)
    movie.actors = Array(selectedActors)
    
    selectedActors.forEach { actor in
      actor.movies.append(movie)
      modelContext.insert(actor)
    }
    
    print("Adding movie \(title) - \(year)")
    modelContext.insert(movie)
    saveMovie()
  }
  
  
  
  
  
  func updateMovie(movie: Movie, title: String, year: Int?) {
    guard let year = year else {
      print("Update cancelled: Year is nil")
      return
    }
    
    movie.name = title
    movie.year = year
    saveMovie()
  }
  
  func deleteMovie(at indexSet: IndexSet, movies: [Movie]) {
    indexSet.forEach { index in
    let movie = movies[index]
      modelContext.delete(movie)
      saveMovie()
    }
  }
  
  func saveMovie(){
    print("Attempting to save changes...")
    do {
      try modelContext.save()
      print("Changes saved successfully.")
    } catch {
      print("Failed to save changes: \(error.localizedDescription)")
    }
  }
}
