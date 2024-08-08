//
//  View.swift
//  MyVote
//
//  Created by Danielle Smith on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ClientViewModel()
    
    var body: some View {
        NavigationView {
            VStack() {
                List(viewModel.candidates, id: \.candidate_id) {
                    candidate in NavigationLink(destination: CandidateInfoView(candidateID: candidate.candidate_id, viewModel: viewModel)) {
                            Text(candidate.name)
                    }
                }
            }
            .padding()
            .navigationTitle("Candidates")
            .onAppear {
                viewModel.fetchCandidateNames()
                viewModel.resetCandidateInfo()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
