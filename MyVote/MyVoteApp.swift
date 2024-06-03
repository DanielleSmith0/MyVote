//
//  MyVoteApp.swift
//  MyVote
//
//  Created by Danielle Smith on 4/12/24.
//
//Plan: Start by investigating API
//--DO you want multiple API's?
//Learn how to make fetch request
//Decide what you want included
//--How do you want to organize it?
//Make CoreData
//--How will CoreData receive data?
//Design app
//Draw outline
//Make and connect views
//Fill in views
//Stylize
//How do you want it to update?
//Have tested - Fix bugs
//Publish

import SwiftUI
import SwiftData

@main
struct MyVoteApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Candidate.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
