//
//  View.swift
//  MyVote
//
//  Created by Danielle Smith on 6/25/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ClientViewModel()
    
    private var groupedCandidates: [String: [CandidateNameID]]{
        Dictionary<String, [CandidateNameID]>(grouping: viewModel.candidates, by: {(candidate: CandidateNameID) -> String in
            candidate.party_full ?? "UKNOWN PARTY"
        })
    }
    
    var body: some View {
        NavigationView {
            VStack() {
                List{
                    ForEach (groupedCandidates.keys.sorted(), id: \.self) { party in
                        DisclosureGroup(
                            content: {
                                ForEach(groupedCandidates[party]!, id: \.candidate_id) { candidate in
                                    NavigationLink(destination: CandidateInfoView(candidateID: candidate.candidate_id, viewModel: viewModel)) {
                                        Text(candidate.name)
                                    }
                                }
                            },
                            label: {
                                Text(party)
                                    .foregroundStyle(partyColor(party))
                            }
                        )
                    }
                }
            }
            .padding()
            .navigationTitle("Candidates")
            .onAppear {
                viewModel.fetchCandidateNames()
            }
        }
    }
    private func partyColor(_ party: String) -> Color {
        switch party {
        case "DEMOCRATIC PARTY":
            return .blue
        case "REPUBLICAN PARTY":
            return .red
        case "GREEN PARTY":
            return .green
        case "SOCIALIST EQUALITY PARTY":
            return .purple
        default:
            return .yellow
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
