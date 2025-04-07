//
//  AddMovieScreenToolbar.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI

struct AddMovieScreenToolbar: ToolbarContent {
  let onClose: () -> Void
  let onSave: () -> Void
  let isSaveDisabled: Bool
    var body: some ToolbarContent {

      ToolbarItem(placement: .topBarLeading) {
        Button("Close") {
          onClose()
      }
    }
      
      ToolbarItem(placement: .topBarTrailing) {
Button("Save") {
  onSave()
}
.disabled(isSaveDisabled)
      }
    }
      
}

#Preview {
  NavigationStack {
    Color.clear
      .toolbar {
        AddMovieScreenToolbar(onClose: {}, onSave: {}, isSaveDisabled: false)
      }
  }
}
