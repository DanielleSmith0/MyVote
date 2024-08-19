//
//  Item.swift
//  MyVote
//
//  Created by Danielle Smith on 4/12/24.
//

import Foundation

//For accepting just dictionaries of candidates name with their id's from server
struct CandidateNameID: Codable, Hashable {
    let name: String
    let candidate_id: String
}

//Struct shows dictionary of full information for individual candidates that is expected to be received from server.

struct Candidate: Codable, Hashable {
    let name: String
    let candidate_id: String
    let party: String
    let age: Int
    let categories: [Category]?
    let state: String?
    let incumbant: Bool?
}

struct Category: Codable, Hashable {
    let title: String
    let traits: [Trait]
}

//Struct for candidate's traits displayed in CanInfoView
struct Trait: Codable, Hashable {
    let question: String
    let response: String
}
