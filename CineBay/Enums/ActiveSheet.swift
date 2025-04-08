//
//  ActiveSheet.swift
//  CineBay
//
//  Created by Brandon Jones on 4/9/25.
//



  enum ActiveSheet: Identifiable {
    case addMovie
    case addActor
    case showFilter
    
    var id: Self { self }
  }

