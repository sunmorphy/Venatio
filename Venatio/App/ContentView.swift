//
//  ContentView.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        HomeView(viewModel: homeViewModel).background(SwiftUI.Color.richBlack).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
