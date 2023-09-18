//
//  CategoryRow.swift
//  Venatio
//
//  Created by user236913 on 9/16/23.
//

import SwiftUI

struct GenreRow: View {
    var genre: String
    var body: some View {
        Text(genre)
            .font(Font.footnote)
            .frame(height: 16)
            .bold()
            .foregroundColor(SwiftUI.Color.white)
            .padding(EdgeInsets.init(top: 6, leading: 16, bottom: 6, trailing: 16))
            .background(SwiftUI.Color.amethys)
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        GenreRow(genre: "")
    }
}
