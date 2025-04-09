//
//  MovieEnums.swift
//  CineBay
//
//  Created by Brandon Jones on 4/9/25.
//

enum MovieFilterOption: Identifiable, Hashable {
  case none
  case titleContains(String)
  case reviewCount(Int)
//  case yearIs(Int)
  
  var id: Self { self }
  }


enum MovieSortOption: Identifiable, Hashable {
  case byTitle
  case byYear
  
  var id: Self { self }
}
