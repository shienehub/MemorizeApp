//
//  Difficulty.swift
//  MemorizeApp
//
//  Created by superUser on 6/27/25.
//

import Foundation

enum Difficulty: String, CaseIterable {
    case easy = "Easy (4 cards)"
    case medium = "Medium (8 cards)"
    case hard = "Hard (12 cards)"
    
    var cardCount: Int {
        switch self {
        case .easy: return 4
        case .medium: return 8
        case .hard: return 12
        }
    }
}
