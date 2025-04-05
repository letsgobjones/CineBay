//
//  Strings+Extensions.swift
//  CineBay
//
//  Created by Brandon Jones on 4/5/25.
//

import Foundation

extension String {
  
  var isEmptyOrWhiteSpace: Bool {
     self.trimmingCharacters(in: .whitespaces).isEmpty
  }
}
