//
//  ActorStore.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//


import SwiftUI
import SwiftData

@MainActor
@Observable
final class ActorStore {
  
  private var modelContext: ModelContext
  
  init(modelContext: ModelContext) {
    self.modelContext = modelContext
    print("ActorStore Initialized with context")
  }
  
  func addActor(name: String) {
    let actor = Actor(name: name)
    print("Adding actor \(name)")
    modelContext.insert(actor)
    saveActor()
  }
  
  func saveActor(){
    print("Attempting to save changes...")
    do {
      try modelContext.save()
      print("Changes saved successfully.")
    } catch {
      print("Failed to save changes: \(error.localizedDescription)")
    }
  }
  
  
  
}
