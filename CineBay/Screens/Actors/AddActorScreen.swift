//
//  AddActorScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI

struct AddActorScreen: View {
  @State var actorName: String = ""
  var body: some View {
    VStack {
      Text("Add Actor")
        .font(.largeTitle)
      
      TextField("Actor name", text: $actorName)
        .textFieldStyle(.roundedBorder)
 
        .padding()
      
      Button("Save") {
        // Save actor to database
      }
      .buttonStyle(.bordered)
      .padding()
    }
    .presentationDetents([.fraction(0.25)])
  }
}

#Preview {
    AddActorScreen()
}
