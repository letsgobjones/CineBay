//
//  FilterSelectionScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/9/25.
//

import SwiftUI

struct FilterSelectionScreen: View {
  
  @Environment(\.dismiss) private var dismiss
  
  @State private var movieTitle: String = ""
  @State private var numberOfReviews: Int?
  @State private var numberOfActors: Int?
  @Binding var filterOption: MovieFilterOption
  
    var body: some View {
      Form{
        Section("Filter by title") {
        TextField("Movie Title", text: $movieTitle)
          Button("Search") {
          filterOption = .titleContains(movieTitle)
            dismiss()
          }
        }
        
        Section("Filter by review count") {
        TextField("Number of reviews", value: $numberOfReviews, format: .number)
          Button("Search") {
            filterOption = .reviewCount(numberOfReviews ?? 1)
            dismiss()
          }
        }
        
        Section("Filter by number of actors") {
          TextField("Number of actors", value: $numberOfActors, format: .number)
          Button("Search") {
            filterOption = .actorCount(numberOfActors ?? 1)
            dismiss()
          }
        }
        
        
      }
    }
}

#Preview {
  FilterSelectionScreen(filterOption: .constant(.titleContains("Black Panther")))
}






