//
//  GameViewModel.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @Published var gameState: GameState
    
    private var selectedIndices: [Int] = []
    
    init(cards: [Card]) {
        self.gameState = GameState(cards: cards)
    }
    
    func flipCard(at index: Int) {
        guard index < gameState.cards.count else { return }
        guard !gameState.cards[index].isMatched else { return }
        guard !gameState.cards[index].isFaceUp else { return }
        
        var newCards = gameState.cards
        newCards[index].isFaceUp = true
        gameState.cards = newCards
        
        selectedIndices.append(index)
        
        if selectedIndices.count == 2 {
            print("matching logic in")
            let first = selectedIndices[0]
            let second = selectedIndices[1]
            
            print("Checking cards at indices \(first) and \(second): \(gameState.cards[first].symbol) vs \(gameState.cards[second].symbol)")
            
            if gameState.cards[first].symbol == gameState.cards[second].symbol {
                var newCards = gameState.cards
                newCards[first].isMatched = true
                newCards[second].isMatched = true
                gameState.cards = newCards
                gameState.score += 1
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    var newCards = self.gameState.cards
                    newCards[first].isFaceUp = false
                    newCards[second].isFaceUp = false
                    self.gameState.cards = newCards
                }
            }
            
            selectedIndices = []
        }
        
        checkGameOver()
        
    }
    
    func checkGameOver() {
        gameState.isGameOver = gameState.cards.allSatisfy { $0.isMatched }
    }
    
    func restart() {
        let cards = Card.sampleCards
        gameState = GameState(cards: cards)
    }
}
