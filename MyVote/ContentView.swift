//
//  View.swift
//  MyVote
//
//  Created by Danielle Smith on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NamesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    viewModel.fetchCandidateNames()
                }) {
                    Text("Fetch Name List")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                List(viewModel.names, id: \.candidate_id) {
                    candidate in NavigationLink(destination: CandidateInfoView(candidateID: candidate.candidate_id)) {
                        Text(candidate.name)
                    }
                }
            }
            .padding()
            .navigationTitle("Candidates")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
