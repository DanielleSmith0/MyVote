//
//  Item.swift
//  MyVote
//
//  Created by Danielle Smith on 4/12/24.
//

import Foundation

//For accepting just dictionaries of candidates name with their id's from server
struct CandidateName: Codable, Hashable {
    let name: String
    let candidate_id: Int
}

//Struct shows dictionary of full information for individual candidates that is expected to be received from server.

//struct Candidate: Codable, Hashable {
//    let name: String
//    let party: String
//    let traits: [Trait]
//}
//Struct for candidate's traits displayed in CanInfoView
struct Trait: Codable, Hashable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
}

