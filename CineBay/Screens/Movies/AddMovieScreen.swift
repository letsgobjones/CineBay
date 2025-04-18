//
//  AddMovieScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData

struct AddMovieScreen: View {
  
  @Environment(\.dismiss) private var dismiss
  @Environment(AppManager.self) private var appManager
  
  
  @State private var title: String = ""
  @State private var year: Int?
  @State private var selectedActors: Set<Actor> = []
  
  private var isFormValid: Bool {
    title.isEmptyOrWhiteSpace == false && year != nil && !selectedActors.isEmpty
  }
  
  var body: some View {
    Form {
      TextField("Title", text: $title)
      TextField("Year", value: $year, format: .number)
      
      Section("Select Actors") {
        ActorSelectionView(selectedActors: $selectedActors)
      }
    }
    .navigationTitle("Add Movie")
    .toolbar {
      ActionToolbar(leadingActionLabel: "Close",
                    trailingActionLabel: "Save",
                    onLeadingAction: { dismiss() },
                    onTrailingAction: {
        appManager.movieStore.addMovie(title: title, year: year, selectedActors: selectedActors)
        dismiss()
      },
                    isTrailingActionDisabled: !isFormValid)
    }
  }
}



#Preview {
  let appManager = AppManager(modelContainer: PreviewContainer.shared)
  
  NavigationStack {
    AddMovieScreen()
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appManager)
  
}
