//
//  FilterSelectionScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/9/25.
//

import SwiftUI

struct FilterSelectionScreen: View {
  
  @Environment(\.dismiss) private var dismiss
  
  @State private var movieTitle: String = ""
  @Binding var filterOption: FilterOption
  
    var body: some View {
      Form{
        Section("Filter by title") {
        TextField("Movie Title", text: $movieTitle)
          Button("Search") {
          filterOption = .title(movieTitle)
            dismiss()
          }
        }
      }
    }
}

#Preview {
  FilterSelectionScreen(filterOption: .constant(.title("Black Panther")))
}






extension FilterSelectionScreen {
  enum FilterOption {
    case title(String)
  }
}
