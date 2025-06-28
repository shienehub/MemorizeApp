//
//  EventLog.swift
//  MemorizeApp
//
//  Created by superUser on 6/27/25.
//

import Foundation

struct EventLog {
    var event_id: UUID
    var event_time: Date
    var event_type: String
    
    var user_id: String?
    var session_id: UUID?
    var theme: Theme?
    var difficulty: Difficulty?
    
    var card_index: Int?
    var card_symbol: String?
    var is_matched: Bool?
    var score: Int?
    var duration: Double?
    var flips: Int?
}
