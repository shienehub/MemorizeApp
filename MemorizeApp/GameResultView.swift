//
//  GameResultView.swift
//  MemorizeApp
//
//  Created by superUser on 6/29/25.
//

import SwiftUI

struct GameResultView: View {
    let score: Int
    let duration: TimeInterval
    let flips: Int
    let theme: String
    let difficulty: String
    let onPlayAgain: () -> Void
    
    var body: some View {
        
        VStack(spacing: 16) {
            Text("Game Over!")
                .font(.largeTitle)
            VStack(spacing: 8) {
                Text("Score: \(score)")
                Text("Time: \(String(format: "%.1f", duration))s")
                Text("Flips: \(flips)")
                Text("Theme: \(theme)")
                Text("Difficulty: \(difficulty)")
            }
            .font(.title3)
            Button("Play Again") {
                /// 네비게이션 스택에서 게임리절트뷰를 팝, 게임뷰에서 온플레이어게인() 호출
                /// 실제로는 뷰모델에 이벤트를 보내거나, 상위 뷰에서 처리
                /// 예: 프리젠테이션모드.랩티밸류.디스미스() 모달인경우
                /// 또는 네비게이션스택에서 팝
                onPlayAgain()
            }
            .font(.title2)
            .padding()
        }
        .padding()
        .navigationTitle("Game Result View")
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    GameResultView(score: 2, duration: 45.2, flips: 8, theme: "Animals", difficulty: "Easy", onPlayAgain: {})
}
