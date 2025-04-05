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
  @Environment(MovieStore.self) private var movieStore
  
  @State private var title: String = ""
  @State private var year: Int?
  
  private var isFormValid: Bool {
    title.isEmptyOrWhiteSpace == false && year != nil
  }
  
  
  var body: some View {
    Form {
      TextField("Title", text: $title)
      TextField("Year", value: $year, format: .number)
    }
    .navigationTitle("Add Movie")
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button("Close") {
          dismiss()
        }
      }
      ToolbarItem(placement: .topBarTrailing) {
        Button("Save") {
          
          guard let year = year else { return }
          
          _ = Movie(title: title, year: year)
          movieStore.addMovie(title: title, year: year)
          dismiss()
          }
        .disabled(!isFormValid)
         
        }
      }
      
      
    }
  }



#Preview {
  
  let movieStore = MovieStore(modelContext: PreviewContainer.shared.mainContext)
  
  NavigationStack {
    AddMovieScreen()
  }
      .modelContainer(PreviewContainer.shared)
      .environment(movieStore)
  
}
