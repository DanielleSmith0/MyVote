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
                    let candidateFullName = viewModel.nameOrder(candidate.name)
//                    VStack (alignment: .leading) {
                        CandidateHeaderView(candidateFullName: candidateFullName, party: candidate.party)
//                      DisclosureGroup Categories with listed traits
                        if let categories = candidate.categories {
                            ForEach(categories.indices, id:\.self) { catIndex in
                                if isExpanded.indices.contains(catIndex) {
                                    CandidateCategoryView(
                                        isExpanded:$isExpanded[catIndex],
                                        category: categories[catIndex]
                                    )
                                }
                            }
                        } else {
                            Text("No information about this candidate seems to be available.")
                                .padding()
                        }
                        Spacer()
//                    }
                    .padding()
                } else {
                    Text("Loading...")
                        .onAppear{
                            viewModel.fetchCandidateInfo(candidateID: candidateID)
                        }
                }
            }
            .padding()
            .onChange(of: viewModel.candidateDetail){
                if let categories = viewModel.candidateDetail?.categories {
                    isExpanded = Array(repeating: false, count: categories.count)
                }
            }
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
//                .frame(maxWidth: .infinity, maxHeight: 500)
        )
        .onAppear{
                viewModel.fetchCandidateInfo(candidateID: candidateID)
        }
    }
}

struct CandidateHeaderView: View {
    let candidateFullName: String
    let party: String
    var body: some View {
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
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 5)
                Text(party)
                    .padding(.bottom, 5)
                    .foregroundStyle(Color.white)
            }
            Spacer()//pushes content upwards since it's a VStack.
        }
        .padding(.bottom, 20)
        .padding(.horizontal)
//        .offset(x: 0, y: -30)
        .edgesIgnoringSafeArea([.top])
    }
}

struct CandidateCategoryView: View {
    @Binding var isExpanded: Bool
    let category: Category
    
    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                VStack (alignment: .leading, spacing: 10) {
                    Divider()
                        .background(Color.white)
                        .padding(.top, 2)
                        .padding(.bottom, 5)
                    ForEach(category.traits.indices, id:\.self) { traitIndex in
                        VStack (alignment: .leading, spacing: 5) {
                            Text(category.traits[traitIndex].question)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            Text(category.traits[traitIndex].response)
                                .font(.body)
                                .foregroundStyle(.white)
                        }
                        .padding(.vertical, 5)
                    }

                    Spacer()
                        .frame(height: 10)
                }
                .padding(.horizontal)
            },
            label: {
                Text(category.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
            }
        )
        .padding(.horizontal)
        .padding(.vertical, 5)
        .tint(.white)
        .background(RoundedRectangle(cornerRadius: 25.0)
            .fill(Color.plum)
            .opacity(0.85)
        )
    }
}

struct CandidateInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CandidateInfoView(candidateID: "1", viewModel: ClientViewModel())
    }
}
