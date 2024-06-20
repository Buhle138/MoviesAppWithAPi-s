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

class MovieStore: ObservableObject {
    
    @Published var movies: [Movie]? = [Movie]()
    
    func getAll(){
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=Batman&apikey=eb99ee82") else{
            fatalError("Invalid URL")
        }
     
        URLSession.shared.dataTask(with: url){data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            
            let movieResponse = try? JSONDecoder().decode(MovieResponse.self, from: data)
            if let movieResponse = movieResponse{
                DispatchQueue.main.async {
                    self.movies = movieResponse.movies
                }
               
            }
            
        }.resume()
        
        
    }
    
}
