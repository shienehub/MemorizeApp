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
    @Published var currentTheme: Theme = .animal
    @Published var currentDifficulty: Difficulty = .easy
    
    private var selectedIndices: [Int] = []
    private var totalFlips: Int = 0
    private var gameStartTime: Date?
    private var currentSessionId: UUID = UUID()
    private var eventLogs: [EventLog] = []
    
    init() {
        self.gameState = GameState(cards: [])
        startGame()
    }
    
    init(cards: [Card]) {
        self.gameState = GameState(cards: cards)
    }
    
    func addEvent(event_type: String, properties: [String: Any] = [:]) {
        var event = EventLog(
            event_id: UUID(),
            event_time: Date(),
            event_type: event_type,
            user_id: "testor001",
            session_id: currentSessionId,
            theme: currentTheme,
            difficulty: currentDifficulty
        )
        
        switch event_type {
        case "card_flipped":
            event.card_index = properties["index"] as? Int
            event.card_symbol = properties["symbol"] as? String
        case "card_matched", "card_mismatched":
            event.card_index = properties["index1"] as? Int
            event.is_matched = (event_type == "card_matched")
        case "game_ended":
            event.score = properties["score"] as? Int
            event.duration = properties["time"] as? Double
            event.flips = properties["flips"] as? Int
        default:
            break
        }
        
        eventLogs.append(event)
        print("Event: \(event.event_type)")
        print()
    }
    
    func chagneDifficulty(to difficulty: Difficulty) {
        currentDifficulty = difficulty
        addEvent(event_type: "difficulty_changed", properties: ["difficulty" : difficulty])
        resetGame()
    }
    
    func changeTheme(to theme: Theme) {
        currentTheme = theme
        addEvent(event_type: "theme_changed", properties: ["theme": theme])
        resetGame()
    }
    
    func flipCard(at index: Int) {
        guard index < gameState.cards.count else { return }
        guard !gameState.cards[index].isMatched else { return }
        guard !gameState.cards[index].isFaceUp else { return }
        
        var newCards = gameState.cards
        newCards[index].isFaceUp = true
        gameState.cards = newCards
        
        selectedIndices.append(index)
        totalFlips += 1
        
        if selectedIndices.count == 2 {
            print("matching logic in")
            let first = selectedIndices[0]
            let second = selectedIndices[1]
            
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
    
    func flipLog(at index: Int, symbol: String) {

        addEvent(event_type: "card_flipped", properties: ["index": index, "symbol": symbol])
        
        if selectedIndices.count == 1 {
            let first = selectedIndices[0]
            if gameState.cards[first].symbol == gameState.cards[index].symbol {
                addEvent(event_type: "card_matched", properties: ["index1": first, "index2": index, "symbol": gameState.cards[first].symbol])
                
            } else {
                addEvent(event_type: "card_mismatched", properties: ["index1": first, "index2": index])
            }
            selectedIndices = []
        } else {
            selectedIndices.append(index)
        }
    }
    
    func startGame() {
        gameStartTime = Date()
        gameState.score = 0
        totalFlips = 0
        currentSessionId = UUID()
        addEvent(event_type: "game_started")
        resetGame()
    }
    
    func resetGame() {
        totalFlips = 0
        addEvent(event_type: "game_reset")
        
        let cardPairs = max(1, currentDifficulty.cardCount / 2)
        let symbols = Array(currentTheme.symbols.shuffled().prefix(cardPairs))
        let cardSymbols = (symbols + symbols).shuffled()
        let cards = cardSymbols.map { symbol in
            Card(id: UUID(), symbol: symbol, isFaceUp: false, isMatched: false)
        }
        
        gameState = GameState(cards: cards)
        gameState.isGameOver = false
        selectedIndices = []
        
    }
    
    func checkGameOver() {
        if gameState.cards.allSatisfy({ $0.isMatched}) {
            gameState.isGameOver = true
            endgame()
        }
    }
    
    func endgame() {
        let duration = Date().timeIntervalSince(gameStartTime ?? Date())
        addEvent(event_type: "game_ended", properties: [
            "score": gameState.score,
            "time": duration,
            "flips": totalFlips,
        ])
        
        print("""
--- 게임 종료 ---
점수: \(gameState.score)
소요 시간: \(String(format: "%.2f", duration))초
뒤집은 수: \(totalFlips)
테마: \(currentTheme.name)
난이도: \(currentDifficulty.rawValue)
---------------

""")
    }
    
    func restart() {
        let cards = Card.sampleCards
        gameState = GameState(cards: cards)
    }
}
