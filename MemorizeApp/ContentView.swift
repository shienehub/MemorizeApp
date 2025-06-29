//
//  ContentView.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GameViewModel()
    
    var body: some View {
        NavigationLink("Start Game", destination: GameView(viewModel: viewModel))
    }
}

#Preview {
    ContentView()
}
