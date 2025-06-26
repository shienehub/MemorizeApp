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
        
        Picker("Difficulty", selection: $viewModel.currentDifficulty) {
            ForEach(Difficulty.allCases, id:\.self) { difficulty in
                Text(difficulty.rawValue).tag(difficulty)
            }
        }
        .pickerStyle(.segmented)
        .padding()
        .onChange(of: viewModel.currentDifficulty) { _ in
            viewModel.chagneDifficulty(to: viewModel.currentDifficulty)
        }
        
        Picker("Theme", selection: $viewModel.currentTheme) {
            ForEach([Theme.animal, Theme.fruit, Theme.vehicle], id: \.self) { theme in
                Text(theme.name).tag(theme)
            }
        }
        .pickerStyle(.segmented)
        .padding()
        .onChange(of: viewModel.currentTheme) { _ in
            viewModel.changeTheme(to: viewModel.currentTheme)
        }
        
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
    let viewModel = GameViewModel()
    viewModel.changeTheme(to: .vehicle)
    return GameView(viewModel: viewModel)
}
