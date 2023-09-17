//
//  ErrorView.swift
//  Venatio
//
//  Created by user236913 on 9/16/23.
//

import SwiftUI

struct ErrorView: View {
    var message: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Error").font(Font.title2).bold().foregroundColor(.red)
            Text(message).font(.subheadline).bold().foregroundColor(.red.opacity(0.7))
            Divider()
        }.padding(EdgeInsets(top: 16, leading: 64, bottom: 16, trailing: 64))
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "error")
    }
}
