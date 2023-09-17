//
//  DetailView.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import SwiftUI
import WrappingHStack
import Kingfisher

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = DetailViewModel()
    
    var id: String
    
    var body: some View {
        ScrollView(.vertical) {
            switch viewModel.dataState {
            case .Idle:
                EmptyView()
            case .Loading:
                ProgressView()
            case .Success(let details):
                VStack(alignment: .leading) {
                    ZStack {
                        SwiftUI.Color.clear.overlay {
                            KFImage.url(URL(string: details.backgroundImage)).cacheMemoryOnly().fade(duration: 0.25).resizable()
                                .aspectRatio(contentMode: .fill)
                        }.clipped()
                        LinearGradient(gradient: Gradient(colors: [SwiftUI.Color.black.opacity(0.75), SwiftUI.Color.clear]), startPoint: .top, endPoint: .bottom)
                    }.frame(height: 256)
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                HStack(spacing: 8) {
                                    Image(systemName: "calendar").renderingMode(.template)
                                    Text(formatDateToMedium(dateFormat: "yyyy-MM-dd",date: details.released)).font(Font.caption2)
                                }
                                Spacer()
                                Text(String(details.rating)).font(Font.callout).fontWeight(.medium).padding(EdgeInsets.init(top: 4, leading: 4, bottom: 4, trailing: 4)).background(SwiftUI.Color.savoyBlue).clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            Text(details.nameOriginal).font(Font.title).bold()
                        }
                        WrappingHStack(details.genres, id: \.self) { genre in
                            GenreRow(genre: genre.name).padding(EdgeInsets.init(top: 4, leading: 4, bottom: 4, trailing: 4))
                        }
                        Text(details.descriptionRaw).font(Font.subheadline).foregroundColor(.white.opacity(0.8))
                    }.padding(EdgeInsets.init(top: 12, leading: 18, bottom: 12, trailing: 18))
                    Spacer()
                }.foregroundColor(SwiftUI.Color.white)
            case .Error(message: let message):
                ErrorView(message: message)
            }
        }
        .onAppear {
            viewModel.fetchGameDetail(id: id)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailViewModel(), id: "34987889").background(SwiftUI.Color.richBlack)
    }
}
