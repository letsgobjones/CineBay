//
//  ActorListView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI
import SwiftData

struct ActorListView: View {
  @Environment(AppManager.self) private var appManager
  let actors: [Actor]
    var body: some View {
      List(actors) { actor in
       Text(actor.name)
      }
    }
}

#Preview {
  let appManager = AppManager(modelContainer: PreviewContainer.shared)
  NavigationStack {
    ActorListView(actors: Actor.example)
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appManager)

}
