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
      HStack(alignment: .firstTextBaseline) {
        VStack(alignment: .leading) {
          Text(movie.title)
          Text("Number of reviews: \(movie.reviewsCount)")
            .font(.caption)
          Text("Number of actors: \(movie.actorsCount)")
            .font(.caption)
        }
        Spacer()
        Text(movie.year.description)
      }
    }
}

#Preview {

    MovieListCellView(movie: .example[0])
      .padding()
  
}
