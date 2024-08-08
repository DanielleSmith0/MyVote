//
//  CanInfoView.swift
//  MyVote
//
//  Created by Danielle Smith on 6/28/24.
//

import SwiftUI

struct CandidateInfoView: View {
    let candidateID: String
    @State private var isExpanded : [Bool] = []
    @ObservedObject var viewModel: ClientViewModel
    var body: some View {
        ScrollView {
            VStack {
                if let candidate = viewModel.candidateDetail {
                    let candidateFullName = viewModel.nameOrder("\(candidate.name)")
                    VStack (alignment: .leading) {
                        HStack(alignment: .top) {
                            //Placeholder image
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 130, height: 130)
                                .cornerRadius(8)
                                .padding(.trailing)
                            //Stack of candidate's name and party
                            VStack (alignment: .leading) {
                                Text(candidateFullName)
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.leading)
                                    .padding(.bottom, 5)
                                Text(candidate.party)
                                    .padding(.bottom, 5)
                            }
                            Spacer()//pushes content upwards since it's a VStack.
                        }
                        .padding(.horizontal)
                        
//                      DisclosureGroup Categories with listed traits
                        if let categories = candidate.categories {
                            ForEach(categories.indices, id:\.self) { catIndex in
                                DisclosureGroup(
                                    isExpanded: Binding(
                                        get:{isExpanded.indices.contains(catIndex) ? isExpanded[catIndex] : false},
                                        set:{isExpanded[catIndex] = $0}
                                    ),
                                    content: {
                                        VStack (alignment: .leading, spacing: 10) {
                                            ForEach(categories[catIndex].traits.indices, id:\.self) { traitIndex in
                                                VStack (alignment: .leading, spacing: 5) {
                                                    Text(categories[catIndex].traits[traitIndex].question)
                                                        .font(.subheadline)
                                                        .fontWeight(.semibold)
                                                    Text(categories[catIndex].traits[traitIndex].response)
                                                        .font(.body)
                                                }
                                                .padding(.vertical, 5)
                                            }
                                        }
                                        .padding(.horizontal)
},
                                    label: {
                                        Text(categories[catIndex].title)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .padding()
                                    }
                                )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                                .background(RoundedRectangle(cornerRadius: 25.0)
                                    .fill(Color.red)
                                    .opacity(0.2)
                                )
                            }
                        } else {
                            Text("No information about this candidate seems to be available.")
                                .padding()
                        }
                        Spacer()
                    }
                    .padding()
                } else {
                    Text("Loading...")
                        .onAppear{
                            viewModel.fetchCandidateInfo(candidateID: candidateID)
                        }
                }
            }
            .onAppear {
                if let categories = viewModel.candidateDetail?.categories {
                        isExpanded = Array(repeating: false, count: categories.count)
                    }
                }
            .onDisappear {
                viewModel.resetCandidateInfo()
            }
        }
    }
}

struct CandidateInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CandidateInfoView(candidateID: "1", viewModel: ClientViewModel())
    }
}
