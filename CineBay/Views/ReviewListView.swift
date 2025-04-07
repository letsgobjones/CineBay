//
//  ReviewListView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI

struct ReviewListView: View {
    @Environment(AppManager.self) private var appManager

  let movie: Movie
    var body: some View {
      if let reviews = movie.reviews, !reviews.isEmpty {
        List {
          ForEach(reviews) { review in
            ReviewListCellView(review: review)
          }.onDelete { indexSet in appManager.reviewStore.deleteReview(at: indexSet, movie: movie)
          }
          
        }
      }else {
        ContentUnavailableView {
          Label("No Reviews", systemImage: "list.bullet")
        } description: {
          Text("Be the first to add a review for this movie.")
        }
      }
    
      
    }
  }
  
  
  #Preview {
    let appManager = AppManager(modelContainer: PreviewContainer.shared)
    
    NavigationStack {
      ReviewListView( movie:Movie.example[0])
    }
    .modelContainer(PreviewContainer.shared)
    .environment(appManager)
  }

