/*
 ClosuresAndHTTPRequests
 A guide to motivate the use of closures
 Author: Nicholas Zufelt
 Date: 2020-03-26
 */

import UIKit // needed for the URL class

let encoder = JSONEncoder()

func getRequest(from urlString: String) {
    guard let url = URL(string: urlString) else {return} // Error creating URL

    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Client error: \(error)")
            return
        }
        guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
                print("Server error: \(String(describing: response))")
            return
        }
        if let mimeType = httpResponse.mimeType, mimeType == "application/json",
            let data = data,
            let string = String(data: data, encoding: .utf8) {
            DispatchQueue.main.async {
                // Put your actual code here!
                print(string)
            }
        }
    }
    task.resume()
}

// points: has closures in it, and really needs one as well.
