//
//  ContentView.swift
//  MoviesAppWithAPi's
//
//  Created by Buhle Radzilani on 2024/06/19.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: MovieStore
    @State var search: String
    
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        
        
            NavigationView{
                
                ScrollView{
                    VStack{
                        TextField("Search", text: $search)
                                       .padding()
                                       .textFieldStyle(RoundedBorderTextFieldStyle())
                        LazyVGrid(columns: columns){
                           
                            ForEach(store.movies ?? [Movie](), id: \.imdbID){
                                movie in
                                NavigationLink{
                                    Text(movie.title)
                                }label: {
                                    VStack{
                                        AsyncImage(url: URL(string: movie.poster)) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .clipShape(Circle())
                                            
                                        } placeholder: {
                                            Circle()
                                                .foregroundColor(.secondary)
                                        }
                                        .frame(width: 120, height: 120)
                                        
                                        Text(movie.title)
                                            .frame(maxHeight: .infinity, alignment: .top)
                                    }
                                }
                                
                                
                            }
                        }
                    }
                }
                .navigationTitle("Movies")
            }
        
        
            .onAppear{
                store.getAll()
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(store: MovieStore(), search: "")
    }
}
