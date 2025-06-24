//
//  CardView.swift
//  MemorizeApp
//
//  Created by superUser on 6/24/25.
//

import SwiftUI

struct CardView: View {
    let card: Card
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
            
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .strokeBorder(lineWidth: 2)
                        )
                        .overlay(
                            Text(card.symbol)
                                .font(.largeTitle)
                            )
            }
            
        }
        .frame(width: 80, height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .rotation3DEffect(
            .degrees(card.isFaceUp ? 0 : 180),
                                  axis: (x: 0.0, y: 1.0, z: 0.0)
        )
        .animation(.bouncy, value: card.isFaceUp)
        .onTapGesture {
            onTap()
        }
    }
}


#Preview {
    CardView(
        card: Card(id: UUID(), symbol: "🐶", isFaceUp: true, isMatched: false),
        onTap: {}
    )
}

