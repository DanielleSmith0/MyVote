//
//  Item.swift
//  MyVote
//
//  Created by Danielle Smith on 4/12/24.
//

import Foundation
import SwiftData

@Model
class Candidate {
    var name: String
    var running: String
    var platform: String
    var party: String
    var votingHistory: String
    
    init(name: String, running: String, platform: String, party: String, votingHistory: String) {
        self.name = name
        self.running = running
        self.platform = platform
        self.party = party
        self.votingHistory = votingHistory
    }
}
