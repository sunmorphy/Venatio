//
//  ContentView.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView().background(SwiftUI.Color.richBlack).preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension SwiftUI.Color {
    static let richBlack = SwiftUI.Color("richBlackColor")
    static let savoyBlue = SwiftUI.Color("savoyBlueColor")
    static let amethys = SwiftUI.Color("amethysColor")
    static let carnationPink = SwiftUI.Color("carnationPinkColor")
}
