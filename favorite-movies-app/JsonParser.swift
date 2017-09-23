//
//  JsonParser.swift
//  favorite-movies-app
//
//  Created by Leon Sacks on 9/22/17.
//  Copyright © 2017 Leon Sacks. All rights reserved.
//

import Foundation

class JsonParser {
    static func parse (data: Data) -> [String: AnyObject]? {
        let options = JSONSerialization.ReadingOptions()
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: options)
                as? [String: AnyObject]
            
            return json!
        } catch(let parseError){
            print("Parse error: \(parseError)")
        }
        
        return nil
    }
}
