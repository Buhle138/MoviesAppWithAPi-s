//
//  ContentView.swift
//  MoviesAppWithAPi's
//
//  Created by Buhle Radzilani on 2024/06/19.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: MovieStore
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        
       
        LazyVGrid(columns: columns){
            
            ForEach(store.movies ?? [Movie](), id: \.imdbID){
                movie in
                
                Text(movie.title)
            }
            
        }
        
            .onAppear{
                store.getAll()
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: MovieStore())
    }
}
