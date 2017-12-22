//
//  NewDeck.swift
//  AC-iOS-MidUnit4Assessment-StudentVersion
//
//  Created by Ashlee Krammer on 12/22/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct NewDeck: Codable{
    let shuffled: Bool
    let deck_id: String
    let remaining: Int
    let success: Bool
}
