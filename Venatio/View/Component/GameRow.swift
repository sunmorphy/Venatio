//
//  GameRow.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import SwiftUI
import Kingfisher

struct GameRow: View {
    var game: Result?
    
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            KFImage.url(URL(string: game!.backgroundImage)).cacheMemoryOnly().fade(duration: 0.25).resizable().frame(width: 80, height: 80).clipShape(RoundedRectangle.init(cornerRadius: 24)).shadow(color: SwiftUI.Color.white.opacity(0.25),radius: 12)
            VStack(alignment: .leading, spacing: 8) {
                Text(game!.name).font(Font.headline).foregroundColor(SwiftUI.Color.white)
                HStack(spacing: 8) {
                    Image(systemName: "calendar").renderingMode(.template)
                    Text(formatDateToMedium(dateFormat: "yyyy-MM-dd",date: game!.released)).font(Font.caption2)
                }
                Text(String(game!.rating)).font(Font.caption2).fontWeight(.medium).padding(EdgeInsets.init(top: 4, leading: 4, bottom: 4, trailing: 4)).background(SwiftUI.Color.savoyBlue).clipShape(RoundedRectangle(cornerRadius: 8))
            }.padding(EdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 64))
            Spacer()
        }.padding(EdgeInsets.init(top: 12, leading: 8, bottom: 12, trailing: 8)).foregroundColor(.white)
    }
}

struct GameRow_Previews: PreviewProvider {
    static var previews: some View {
        GameRow(game: nil).background(SwiftUI.Color.richBlack)
    }
}
