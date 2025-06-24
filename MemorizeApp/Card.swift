//
//  Card.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import Foundation

struct Card: Identifiable {
    let id: UUID
    let symbol: String
    var isFaceUp: Bool
    var isMatched: Bool

    init(id: UUID, symbol: String, isFaceUp: Bool, isMatched: Bool) {
        self.id = id
        self.symbol = symbol
        self.isFaceUp = isFaceUp
        self.isMatched = isMatched
    }
    
    init(symbol: String) {
        self.init(id: UUID(), symbol: symbol, isFaceUp: false, isMatched: false)
    }
}

extension Card {
    static let sampleCards: [Card] = [
        Card(id: UUID(), symbol: "🐶", isFaceUp: false, isMatched: false),
        Card(id: UUID(), symbol: "🐱", isFaceUp: false, isMatched: false),
        Card(id: UUID(), symbol: "🐶", isFaceUp: false, isMatched: false),
        Card(id: UUID(), symbol: "🐱", isFaceUp: false, isMatched: false),
    ]
}
