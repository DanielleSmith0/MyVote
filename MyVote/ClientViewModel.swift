//
//  Client.swift
//  MyVote
//
//  Created by Danielle Smith on 6/20/24.
//

import Foundation
import Combine

class NamesViewModel: ObservableObject {
    //Published makes it so the variable is observable, so if names gets updated, the UI can adapt accordingly.
    @Published var names: [String] = []
    
    func fetchNames() {
        let serverUrl = URL(string: "http://192.168.1.68:5000/name_id")!
        
        let task = URLSession.shared.dataTask(with: serverUrl) { data, response, error in
            //Handle response:
            
            //Handle error:
            if let error = error {
                print("Could not connect to the server: \(error)")
                return
            }
            
            // The response is just metadata, such as a status code to confirm if it worked.
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response or status code not 200")
                return
            }
            
            //Checks for valid data
            if let data = data {
                do {
                    let names = try JSONDecoder().decode([String].self, from: data)
                    //Updates the names property on the main thread. This ensures the UI is updated safely since UI updates must occur on the main thread.
                    DispatchQueue.main.async {
                        self.names = names
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
}
