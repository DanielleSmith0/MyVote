//
//  WelcomeView.swift
//  MyVote
//
//  Created by Danielle Smith on 8/19/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var navigateToContentView = false
    
    var body: some View {
        NavigationStack{
            VStack (alignment: .center, spacing: 20) {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    .foregroundColor(.plum)
                    .padding(.bottom, 20)
                
                Text("Welcome to MyVote")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("""
                    You can explore the list of all the candidates for the upcoming presidential election. Learn their views on important topics, so you can see how well they align with your beliefs.
                    
                    Click the button below to get started!
                    """)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                
                Spacer()
  
                Button (action: {navigateToContentView = true})
                {
                    Text("See Candidates")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.plum)
                        .cornerRadius(25)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationDestination(isPresented: $navigateToContentView){
                ContentView()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
