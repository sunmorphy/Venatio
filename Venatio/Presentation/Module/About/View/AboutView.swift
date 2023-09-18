//
//  AboutView.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("andikas").resizable().frame(width: 128, height: 128).clipShape(RoundedRectangle(cornerRadius: 128))
                Text("Andika Sultanrafli").font(Font.title3).bold().padding(EdgeInsets.init(top: 8, leading: 0, bottom: 0, trailing: 0))
                Text("Mobile Developer @IOTANESIA").font(Font.subheadline).italic()
                Text("andikas.dev@gmail.com").font(Font.subheadline).padding(EdgeInsets.init(top: 2, leading: 0, bottom: 0, trailing: 0))
                Text("https://github.com/sunmorphy").font(Font.subheadline)
                Spacer()
            }.padding(EdgeInsets.init(top: 48, leading: 12, bottom: 0, trailing: 12))
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
