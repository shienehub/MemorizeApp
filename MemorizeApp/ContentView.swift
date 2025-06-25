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
        GameView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
