//
//  ActorSlectionView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI
import SwiftData

struct ActorSelectionView: View {
  @Environment(AppManager.self) private var appManager
  @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
  
  @Binding var selectedActors: Set<Actor>
  
    var body: some View {
      List(actors) { actor in
        HStack {
          Image(systemName: selectedActors.contains(actor) ? "checkmark.square" : "square")
            .onTapGesture {
              if !selectedActors.contains(actor) {
                selectedActors.insert(actor)
              } else {
                selectedActors.remove(actor)
              }
            }
          Text(actor.name)
        }
        
      }
    }
}

#Preview {
  let context = PreviewContainer.shared.mainContext
  let appManager = AppManager(modelContainer: PreviewContainer.shared)
  
    for actor in Actor.example {
      context.insert(actor)
    }
  try! context.save()

   return NavigationStack {
     ActorSelectionView(selectedActors: .constant(Set<Actor>()))
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appManager)
}
