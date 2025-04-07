//
//  MovieDetailScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/6/25.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
  
  @Environment(AppServices.self) private var appServices
  let movie: Movie
  
  @State private var title: String = ""
  @State private var year: Int?
  @State private var showReviewScreen: Bool = false
    var body: some View {
      Form {
        TextField("Title", text: $title)
        TextField("Year", value: $year, format: .number)
        Button("Uddate") {
          appServices.movieStore.updateMovie(movie: movie, title: title, year: year)
        }
        .buttonStyle(.borderless)
        
        Section("Reviews") {
         
          Button {
            showReviewScreen = true
          } label: {
            Image(systemName: "plus")
              .frame(maxWidth: .infinity, alignment: .trailing)
          }  .buttonStyle(.borderless)

          
          ReviewListView( movie: movie)
        
        }
        
      }.onAppear {
       title = movie.title
        year = movie.year
      }
      .sheet(isPresented: $showReviewScreen) {
        NavigationStack {
          AddReviewScreen(movie: movie)
        }
      }
    }
}

#Preview {
let appServices = AppServices(modelContainer: PreviewContainer.shared)
  NavigationStack {
    MovieDetailScreen(movie: Movie.example.first!)
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appServices)
}
