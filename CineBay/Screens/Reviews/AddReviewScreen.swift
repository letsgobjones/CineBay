//
//  AddReviewScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI

struct AddReviewScreen: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(MovieStore.self) private var movieStore
  
  let movie: Movie
  
  @State private var subject: String = ""
  @State private var  description: String = ""
  
  
  private var isFormValid: Bool {
!subject.isEmptyOrWhiteSpace && !description.isEmptyOrWhiteSpace
  }
  
  
    var body: some View {
      Form {
        TextField("Subject", text: $subject)
        TextField("Description", text: $description)
   
        
        
      }.navigationTitle("Add Review")
        .toolbar {
          ToolbarItem(placement: .topBarLeading) {
            Button("Close"){
              dismiss()
            }
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button("Save") {
              
            }.disabled(!isFormValid)
          }
          
        }
    }
}

#Preview {
  let movieStore = MovieStore(modelContext: PreviewContainer.shared.mainContext)
  NavigationStack {
    AddReviewScreen(movie: Movie.example[0])
  }
  .environment(movieStore)
  .modelContainer(PreviewContainer.shared)
}
