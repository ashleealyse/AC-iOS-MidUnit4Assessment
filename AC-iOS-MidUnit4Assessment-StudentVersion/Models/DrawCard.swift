//
//  DrawCard.swift
//  AC-iOS-MidUnit4Assessment-StudentVersion
//
//  Created by Ashlee Krammer on 12/22/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct Deck: Codable{
    let cards: [Card]?
    let deck_id: String
    let remaining: Int
    let success: Bool
}

struct Card: Codable {
    let image: String
    let value: String
    let suit: String
}

