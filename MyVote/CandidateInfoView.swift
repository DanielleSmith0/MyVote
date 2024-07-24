//
//  CanInfoView.swift
//  MyVote
//
//  Created by Danielle Smith on 6/28/24.
//

import SwiftUI

struct CandidateInfoView: View {
    let candidateID: Int
    @State private var isExpanded = Array(repeating: false, count: 24)
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
                                Text("Party")
                                    .padding(.bottom, 5)
                            }
                            Spacer()//pushes content upwards since it's a VStack.
                        }
                        .padding(.horizontal)
                        // Categories with nested DisclosureGroups
                        DisclosureGroup( 
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Economy and Taxes")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )                                
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Healthcare")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Social Issues")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Education")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Environment and Energy")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Immigration")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Foreign Policy")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Gun Control")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Voting and Elections")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
                        DisclosureGroup(
                            isExpanded: $isExpanded[0],
                            content: {
                                ForEach(0..<4) { index in
                                    //Expandable lists of traits
                                    if let trait = candidate.traits?[index] {
                                        DisclosureGroup (
                                            isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
                                                Text(trait.description)
                                                    .padding()
                                            },
                                            label: {
                                                Text(trait.title)
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                    .multilineTextAlignment(.leading)
                                                    .padding()
                                                
                                            }
                                        )
                                    }
                                }
                            },
                            label: {
                                Text("Technology and Data Privacy")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .padding()
                            }
                        )
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        
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
            .onDisappear {
                viewModel.resetCandidateInfo()
            }
        }
    }
}

struct CandidateInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CandidateInfoView(candidateID: 1, viewModel: ClientViewModel())
    }
}

//struct CandidateInfoView: View {
//    let candidateID: Int
//    @State private var isExpanded = Array(repeating: false, count: 24)
//    @ObservedObject var viewModel: ClientViewModel
//    var body: some View {
//        ScrollView {
//            VStack {
//                if let candidate = viewModel.candidateDetail {
//                    let candidateFullName = viewModel.nameOrder("\(candidate.name)")
//                    VStack (alignment: .leading) {
//                        HStack(alignment: .top) {
//                            //Placeholder image
//                            Image(systemName: "person.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 130, height: 130)
//                                .cornerRadius(8)
//                                .padding(.trailing)
//                            //Stack of candidate's name and party
//                            VStack (alignment: .leading) {
//                                Text(candidateFullName)
//                                    .font(.title)
//                                    .fontWeight(.medium)
//                                    .multilineTextAlignment(.leading)
//                                    .padding(.bottom, 5)
//                                Text("Party")
//                                    .padding(.bottom, 5)
//                            }
//                            Spacer()//pushes content upwards since it's a VStack.
//                        }
//                        .padding(.horizontal)
//                        //Expandable lists of traits
//                        if let traits = candidate.traits {
//                            ForEach(traits.indices, id: \.self) {
//                                index in DisclosureGroup(
//                                    ////
//                                    //                                isExpanded: $isExpanded[index], content: {
//                                    isExpanded: index < isExpanded.count ? $isExpanded[index] : .constant(false), content: {
//                                        /////
//                                        Text(traits[index].description)
//                                            .padding()
//                                    },
//                                    label: {
//                                        Text(traits[index].title)
//                                            .font(.headline)
//                                            .fontWeight(.semibold)
//                                            .multilineTextAlignment(.leading)
//                                            .padding()
//                                        
//                                    }
//                                )
//                                .padding(.horizontal)
//                                .padding(.vertical, 5)
//                            }
//                        } else {
//                            Text("No information about this candidate seems to be available")
//                                .padding()
//                        }
//                        Spacer()
//                    }
//                    .padding()
//                } else {
//                    Text("Loading...")
//                        .onAppear{
//                            viewModel.fetchCandidateInfo(candidateID: candidateID)
//                        }
//                }
//            }
//            .onDisappear {
//                viewModel.resetCandidateInfo()
//            }
//        }
//    }
//}
//
//struct CandidateInfoView_Previews: PreviewProvider {
//    static var previews: some View {
////        let sampleTraits = [
////            Trait(title: "Political Experience", description: "Has shown excellent leadership qualities in various capacities."),
////            Trait(title: "Positions", description: "Is an effective communicator and public speaker."),
////            Trait(title: "Votes", description: "Has extensive experience in public service and governance.")
////        ]
//        CandidateInfoView(candidateID: 1, viewModel: ClientViewModel())
//    }
//}
