//
//  ContentView.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI

struct ContentView: View {
  @Environment(AppManager.self) private var appManager

  
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
 let appManager = AppManager(modelContainer: PreviewContainer.shared)
  NavigationStack {
    ContentView()
  }
  .modelContainer(PreviewContainer.shared)
  .environment(appManager)
  }

