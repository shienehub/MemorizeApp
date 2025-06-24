//
//  GameView.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        
        Text("Scroe: \(viewModel.gameState.score)")
            .font(.largeTitle)
            .bold()
            .padding()
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(Array(viewModel.gameState.cards.enumerated()), id: \.element.id) { index, card in
                CardView(card: card) {
                    viewModel.flipCard(at: index)
                }
            }
        }
        .padding()
        .alert("Game over", isPresented: $viewModel.gameState.isGameOver) {
            Button("Restart") {
                viewModel.restart()
            }
        } message: {
            Text("Your scroe: \(viewModel.gameState.score)")
        }
    }
}

#Preview {
    GameView(viewModel: GameViewModel(cards: Card.sampleCards))
}
