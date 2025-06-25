//
//  Theme.swift
//  MemorizeApp
//
//  Created by superUser on 6/25/25.
//

import Foundation

struct Theme: Hashable {
    let name: String
    let symbols: [String]
}

extension Theme {
    static let animal = Theme(name: "Animals", symbols: ["🐶","🐱","🦊","🐻","🐼","🐨",])
    static let fruit = Theme(name: "Fruits", symbols: ["🍎","🍌","🍊","🍓","🍉","🍇",])
    static let vehicle = Theme(name: "Vehicle", symbols: ["🚗","🚕","🚙","🚌","🚎","🏎️",])
}
