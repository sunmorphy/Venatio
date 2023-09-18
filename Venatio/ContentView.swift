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

struct ViewDidLoadModifier: ViewModifier {
    @State private var didLoad = false
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }
}

extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}

extension SwiftUI.Color {
    static let richBlack = SwiftUI.Color("richBlackColor")
    static let savoyBlue = SwiftUI.Color("savoyBlueColor")
    static let amethys = SwiftUI.Color("amethysColor")
    static let carnationPink = SwiftUI.Color("carnationPinkColor")
}
