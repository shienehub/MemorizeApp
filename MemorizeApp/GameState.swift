//
//  GameState.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import Foundation

struct GameState {
    var cards: [Card]
    var score: Int
    var isGameOver: Bool
    
    init(cards: [Card]) {
        self.cards = cards
        self.score = 0
        self.isGameOver = false
    }
}

extension GameState {
    static let sampleState = GameState(cards: Card.sampleCards)
}
