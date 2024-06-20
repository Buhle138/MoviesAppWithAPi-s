//
//  MovieStore.swift
//  MoviesAppWithAPi's
//
//  Created by Buhle Radzilani on 2024/06/19.
//

import Foundation

struct MovieResponse: Decodable{
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey {
        case movies = "Search"
    }
}


struct Movie: Decodable{
    let imdbID: String
    let title: String
    let poster: String
    
    private enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case poster = "Poster"
    }
}
