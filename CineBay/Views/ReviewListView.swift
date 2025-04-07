//
//  ReviewListView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI

struct ReviewListView: View {
    @Environment(AppServices.self) private var appServices
  
  let movie: Movie
    var body: some View {
      if let reviews = movie.reviews, !reviews.isEmpty {
        
      } else {
        ContentUnavailableView {
          Label("No Reviews", systemImage: "list.bullet")
        } description: {
          Text("Be the first to add a review for this movie.")
        }
      }
    
      
    }
  }
  
  
  #Preview {
    let appServices = AppServices(modelContainer: PreviewContainer.shared)
    
    NavigationStack {
      ReviewListView(movie:Movie.example.first!)
    }
    .modelContainer(PreviewContainer.shared)
    .environment(appServices)
  }

