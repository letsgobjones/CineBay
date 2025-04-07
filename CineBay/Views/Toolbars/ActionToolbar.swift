//
//  ActionToolbar.swift
//  CineBay
//
//  Created by Brandon Jones on 4/8/25.
//

import SwiftUI

struct ActionToolbar: ToolbarContent {
  let leadingActionLabel: String
  let trailingActionLabel: String
  let onLeadingAction: () -> Void
  let onTrailingAction: () -> Void
  let isTrailingActionDisabled: Bool?
  
  var body: some ToolbarContent {
    ToolbarItem(placement: .topBarLeading) {
      Button(leadingActionLabel) {
        onLeadingAction()
      }
    }
    
    
    ToolbarItem(placement: .topBarTrailing) {
      Button(trailingActionLabel) {
        onTrailingAction()
      }
      .disabled(isTrailingActionDisabled ?? false)
    }
  }
}

#Preview {
  NavigationStack {
    Color.clear
      .toolbar {
        ActionToolbar(leadingActionLabel: "Close", trailingActionLabel: "Action", onLeadingAction: {}, onTrailingAction: {}, isTrailingActionDisabled: true)
      }
  }
}
