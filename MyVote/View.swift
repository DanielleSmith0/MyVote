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
                    viewModel.fetchNames()
                }) {
                    Text("Fetch Names")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.red)
                        .cornerRadius(8)
                }
                List(viewModel.names, id: \.name) {
                    candidate in NavigationLink(destination: CanInfoView(candidate: candidate)) {
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
