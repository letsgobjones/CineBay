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
      
      if !actor.movies.isEmpty {
        Text(actor.movies.map { $0.title }.formatted(.list(type: .and)))
      } else
      {
        Text("No Movies Listed")
          .font(.caption)
          .foregroundColor(.secondary)
      }
      
    }
  }
}

#Preview {
  ActorCellView(actor: Actor.example[0])
  
    .padding()
}


//?? "No Movies Listed")
