//
//  GameView.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel: GameViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(Array(viewModel.gameState.cards.enumerated()), id: \.element.id) { index, card in
                CardView(card: card) {
                    viewModel.flipCard(at: index)
                }
            }
        }
        .padding()
    }
}

#Preview {
    GameView(viewModel: GameViewModel(cards: Card.sampleCards))
}
