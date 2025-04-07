//
//  MovieListCellView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/6/25.
//

import SwiftUI

struct MovieListCellView: View {
  
  var movie: Movie
  
    var body: some View {
      HStack {
        Text(movie.title)
        Spacer()
        Text(movie.year.description)
      }
    }
}

#Preview {

    MovieListCellView(movie: .example[0])
      .padding()
  
}
