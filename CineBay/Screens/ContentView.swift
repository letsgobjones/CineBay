//
//  ContentView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI

struct ContentView: View {
  @Environment(MovieStore.self) private var movieStore
  
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
  let movieStore = MovieStore(modelContext: PreviewContainer.shared.mainContext)
  NavigationStack {
    ContentView()
  }
  .environment(movieStore)
      .modelContainer(PreviewContainer.shared)
  }

