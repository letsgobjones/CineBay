//
//  MovieListScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI
import SwiftData



struct MovieListScreen: View {
  
  @Query private var movies: [Movie]
  @State private var isAddMovieSheetPresented = false
  
    var body: some View {
      List(movies) { movie in
       Text(movie.title)
      }.toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Add Movie") {
           isAddMovieSheetPresented = true
          }
          }
        }
      }
    }


#Preview {
  NavigationStack {
    MovieListScreen()
      .modelContainer(for: [Movie.self])
  }
}
