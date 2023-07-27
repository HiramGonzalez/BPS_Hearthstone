//
//  Card.swift
//  Hearthstone
//
//  Created by BPS.Dev01 on 7/25/23.
//

import Foundation


struct Card: Codable, Hashable {
    var cardId: String
    var name: String
    var cardSet: String?
    var type: String?
    var faction: String?
    var rarity: String?
    var text: String?
    var playerClass: String?
    var img: String?
}

struct SearchResults: Codable {
    var cards: [Card]?
}

