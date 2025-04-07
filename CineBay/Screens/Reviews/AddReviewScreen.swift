//
//  AddReviewScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI

struct AddReviewScreen: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(AppServices.self) private var appServices
  
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
              appServices.reviewStore.addReview(subject: subject, body: description, movie: movie)
            }.disabled(!isFormValid)
          }
          
        }
    }
}

#Preview {
  let appServices = AppServices(modelContainer: PreviewContainer.shared)
  NavigationStack {
    AddReviewScreen(movie: Movie.example[0])
  }
  .environment(appServices)
  .modelContainer(PreviewContainer.shared)
}
