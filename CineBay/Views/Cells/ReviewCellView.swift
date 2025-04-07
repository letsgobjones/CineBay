//
//  ReviewCellView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/7/25.
//

import SwiftUI

struct ReviewCellView: View {
  let review: Review
    var body: some View {
        VStack(alignment: .leading) {
            Text(review.subject)
            Text(review.body)
        }
    }
}

#Preview {
  ReviewCellView(review: Review.example[0])
    .padding()
}
