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
        
        VStack(spacing: 0) {
            Picker("Difficulty", selection: $viewModel.currentDifficulty) {
                ForEach(Difficulty.allCases, id:\.self) { difficulty in
                    Text(difficulty.rawValue).tag(difficulty)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.bottom)
            .onChange(of: viewModel.currentDifficulty) { _ in
                viewModel.chagneDifficulty(to: viewModel.currentDifficulty)
            }
            
            Spacer()
            Picker("Theme", selection: $viewModel.currentTheme) {
                ForEach([Theme.animal, Theme.fruit, Theme.vehicle], id: \.self) { theme in
                    Text(theme.name).tag(theme)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .onChange(of: viewModel.currentTheme) { _ in
                viewModel.changeTheme(to: viewModel.currentTheme)
            }
            
            ScrollView {
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
                
            }//ScrollView
            .frame(minHeight: 450)
            
            HStack {
                
                Text("Score: \(viewModel.gameState.score)")
                    .font(.title)
                    .bold()
                    .padding()
                
                Spacer()
                
                Button("Reset") {
                    viewModel.resetGame()
                }
                .font(.title2)
            }
            .padding(.top)
            .background(Color(UIColor.systemBackground))
            
        }//Vstack
//        .safeAreaInset(edge: .top, content: {
//            Color.clear.frame(height: 44)
//        })
        .padding()
    }//body
    
}//GameView

#Preview {
    let viewModel = GameViewModel()
    return GameView(viewModel: viewModel)
}
