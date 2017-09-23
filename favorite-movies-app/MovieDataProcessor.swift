//
//  MovieDataProcessor.swift
//  favorite-movies-app
//
//  Created by Leon Sacks on 9/22/17.
//  Copyright © 2017 Leon Sacks. All rights reserved.
//

import Foundation

class MovieDataProcessor {
    static func mapJsonToMovies(object: [String: AnyObject], moviesKey: String) ->
        [Movie] {
            var mappedMovies: [Movie] = []
        
            guard let movies = object[moviesKey] as? [[String: AnyObject]] else { return mappedMovies }
            
            for movie in movies {
                guard let id = movie["id"] as? Int,
                      let name = movie["title"] as? String,
                      let year = movie["release_date"] as? String,
                      let imageUrl = movie["poster_path"] as? String else { continue }
                
                let movieClass = Movie(id: String(id), title: name, year: year, imageUrl: "https://image.tmdb.org/t/p/w92\(imageUrl)")
                mappedMovies.append(movieClass)
            }
            return mappedMovies
    }
}
