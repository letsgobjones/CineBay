//
//  AddMovieScreen.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import SwiftUI

struct AddMovieScreen: View {
  
  
  @State private var title: String = ""
  @State private var year: Int?
  
  
  
  
  var body: some View {
    Form {
      TextField("Title", text: $title)
      TextField("Year", value: $year, format: .number)
    }
  }
}


#Preview {
  AddMovieScreen()
}
