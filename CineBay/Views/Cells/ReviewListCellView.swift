//
//  ReviewCellView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI

struct ReviewListCellView: View {
  let review: Review
    var body: some View {
        VStack(alignment: .leading) {
            Text(review.subject)
            Text(review.body)
        }
    }
}

#Preview {
  ReviewListCellView(review: Review.example[0])
    .padding()
}
