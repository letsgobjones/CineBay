//
//  ActorCellView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI

struct ActorCellView: View {
  
  let actor: Actor
    var body: some View {
      VStack(alignment: .leading) {
        Text(actor.name)
        Text((actor.movies?.map { $0.title }).flatMap { $0.formatted(.list(type: .and)) } ?? "No Movies Listed")
          .font(.caption)
      }
    }
}

#Preview {
  ActorCellView(actor: Actor.example[0])
  
    .padding()
}
