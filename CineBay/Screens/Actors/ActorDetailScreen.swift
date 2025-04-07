//
//  ActorDetailScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI
import SwiftData

struct ActorDetailScreen: View {
  @Environment(AppManager.self) private var appManager
  
  let actor: Actor
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
  let appManager = AppManager(modelContainer: PreviewContainer.shared)
  NavigationStack {
    ActorDetailScreen(actor: Actor.example[0])
  }
  .environment(appManager)
  .modelContainer(PreviewContainer.shared)
}
