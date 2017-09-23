//
//  HttpHandler.swift
//  favorite-movies-app
//
//  Created by Leon Sacks on 9/22/17.
//  Copyright © 2017 Leon Sacks. All rights reserved.
//

import Foundation

class HttpHandler {
    static func getJson(urlString: String, completionHandler: @escaping (Data?) ->
        (Void)) {
        let urlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: urlString!)
        
        print("URL being used is \(url!)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if let data = data {
                let httpResponse = response as! HTTPURLResponse
                let statusCode = httpResponse.statusCode
                if(statusCode == 200){
                    print("http handler success")
                    completionHandler(data as Data)
                }
            } else if let error = error {
                print(error.localizedDescription)
                completionHandler(nil)
            }
        }
        print("resuming http handler task")
        task.resume()
    }
}
