//
//  Client.swift
//  MyVote
//
//  Created by Danielle Smith on 6/20/24.
//

import Foundation
import Combine

class ClientViewModel: ObservableObject {
    //Published makes it so the variable is observable, so if names gets updated, the UI can adapt accordingly.
    @Published var candidates: [CandidateNameID] = []
    @Published var candidateDetail: Candidate? = nil
    
    func fetchCandidateNames() {
        guard let serverUrl = URL(string: "http://192.168.1.68:5000/name_id") else {
            print ("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: serverUrl) { data, response, error in
            //Handle error:
            if let error = error {
                print("Could not connect to the server: \(error)")
                return
            }
            
            // The response is just metadata, such as a status code to confirm if it worked and is 200.
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code not 200")
                return
            }
            
            //Checks for valid data
            if let data = data {
                do {
                    let names = try JSONDecoder().decode([CandidateNameID].self, from: data)
                    //Updates the names property on the main thread. This ensures the UI is updated safely since UI updates must occur on the main thread.
                    DispatchQueue.main.async {
                        self.candidates = names
                    }
                } catch {
                    print("Failed to decode response data: \(error)")
                }
            } else {
                print("Failed to get the response data")
            }
        }
        task.resume()
    }
    
    func fetchCandidateInfo(candidateID: String) {
        DispatchQueue.main.async {
            self.candidateDetail = nil
        }

        guard let serverUrl = URL(string: "http://192.168.1.68:5000/get_candidate?candidate_id=\(candidateID)") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: serverUrl) { [weak self] data, response, error in
            if let error = error {
                print("Could not connect to server \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response or status code not 200")
                return
            }

            if let data = data {
                do {
                    let candidateDetail = try JSONDecoder().decode(Candidate.self, from: data)
                    DispatchQueue.main.async {
                        self?.candidateDetail = candidateDetail
                    }
                } catch {
                    print("Failed to decode response data: \(error)")
                }
            } else {
                print("Failed to get the response data")
            }
        }
        task.resume()
    }

    
    func resetCandidateInfo() {
        candidateDetail = nil
    }
    // For making sure name is displayed in candidateInfoView as "First Last" instead of "Last, First"
    func nameOrder(_ candidateName: String) -> (String) {
        if candidateName.contains(",") {
            let parts = candidateName.split(separator: ",")
            let firstName = parts[1].trimmingCharacters(in: .whitespaces)
            let lastName = (parts[0].trimmingCharacters(in: .whitespaces).replacingOccurrences(of: ",", with: ""))
            let correctedName = "\(firstName) " + "\(lastName)"
            //THis is where you add another if statement for containing words like Jr.
            return correctedName
        } else {
            return candidateName
        }
    }
}
