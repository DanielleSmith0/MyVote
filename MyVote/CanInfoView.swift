//
//  CanInfoView.swift
//  MyVote
//
//  Created by Danielle Smith on 6/28/24.
//

import SwiftUI

struct CanInfoView: View {
    let candidate: Candidate
    @State private var isExpanded = Array(repeating: false, count: 3)
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack(alignment: .top) {
                //Placeholder image
                Image(systemName: "person.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
                //Stack of candidate's name and party
                VStack (alignment: .leading) {
                    Text("\(candidate.name)")
                        .font(.largeTitle)
                        .padding(.bottom, 5)
                    Text("Party")
                        .padding(.bottom, 5)
                    Spacer()//pushes content upwards since it's a VStack.
                }
                .padding()
            }
            .padding(.horizontal)
            //Expandable lists of traits
            ForEach(candidate.traits.indices, id: \.self) {
                index in DisclosureGroup(
                    isExpanded: $isExpanded[index], content: {
                        Text(candidate.traits[index].description)
                            .padding()
                    },
                    label: {
                        Text(candidate.traits[index].title)
                            .font(.headline)
                            .padding()
                    }
                )
                .padding(.horizontal)
//                .padding(.vertical, 5)
            }
            Spacer()
        }
        .padding()
    }
}
struct Trait: Codable, Hashable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
}

struct CanInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleTraits = [
            Trait(title: "Political Experience", description: "Has shown excellent leadership qualities in various capacities."),
            Trait(title: "Positions", description: "Is an effective communicator and public speaker."),
            Trait(title: "Votes", description: "Has extensive experience in public service and governance.")
        ]
        CanInfoView(candidate: Candidate(name: "Full Name", party: "Party", traits: sampleTraits))
    }
}
