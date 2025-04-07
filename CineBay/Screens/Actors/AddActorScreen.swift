//
//  AddActorScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI

struct AddActorScreen: View {
  @Environment(\.dismiss) private var dismiss
  @Environment(AppManager.self) private var appManager
  
  @State var actorName: String = ""
  
  private var isFormValid: Bool {
    actorName.isEmptyOrWhiteSpace == false
  }
  
  var body: some View {
    VStack(spacing: 20) {
      Text("Add Actor")
        .font(.largeTitle)
      
      TextField("Actor name", text: $actorName)
        .textFieldStyle(.roundedBorder)
      
      Button("Save") {
       appManager.actorStore.addActor(name: actorName)
        dismiss()
      }
      .disabled(!isFormValid)
      .buttonStyle(.borderedProminent)
      .frame(maxWidth: .infinity)
    }
    .padding()
  }
}

#Preview {
  let appManager = AppManager(modelContainer: PreviewContainer.shared)
  
  // Define a minimal host view inline
  struct Host: View {
    @State private var showSheet = true // Show sheet immediately
    
    var body: some View {
      Color.clear
        .sheet(isPresented: $showSheet) {
          AddActorScreen()
          // Apply detents to the sheet content
            .presentationDetents([.fraction(0.25), .medium])
        }
    }
  }
  // Return an instance of the inline host view
  return Host()
    .environment(appManager)
    .modelContainer(PreviewContainer.shared)
}
