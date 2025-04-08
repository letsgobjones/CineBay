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
  @State private var selectedMovies: Set<Movie> = []
  let actor: Actor
    var body: some View {
      VStack {
       MovieSelectionView(selectedMovies: $selectedMovies)
          .onAppear {
            selectedMovies = Set(actor.movies ?? [])
          }
      }
      .onChange(of: selectedMovies, {
        actor.movies = Array(selectedMovies)
        appManager.actorStore.saveActor()
      }).navigationTitle(actor.name)
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
