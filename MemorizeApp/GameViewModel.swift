//
//  GameViewModel.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var gameState: GameState
    
    init(cards: [Card]) {
        self.gameState = GameState(cards: cards)
    }
    
    func flipCard(at index: Int) {
        guard index < gameState.cards.count else { return }
        gameState.cards[index].isFaceUp.toggle()
    }
}
