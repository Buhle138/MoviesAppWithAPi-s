//
//  MoviesAppWithAPi_sApp.swift
//  MoviesAppWithAPi's
//
//  Created by Buhle Radzilani on 2024/06/19.
//

import SwiftUI

@main
struct MoviesAppWithAPi_sApp: App {
    @StateObject var store = MovieStore()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
