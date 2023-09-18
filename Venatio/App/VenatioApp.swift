//
//  VenatioApp.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import SwiftUI

@main
struct VenatioApp: App {
    let homeViewModel = HomeViewModel(homeUseCase: Injection.init().provideHome())
    let detailViewModel = DetailViewModel(detailUseCase: Injection.init().provideDetail())
    let favoriteViewModel = FavoriteViewModel(favoriteUseCase: Injection.init().provideFavorite())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(homeViewModel).environmentObject(detailViewModel).environmentObject(favoriteViewModel)
        }
    }
}
