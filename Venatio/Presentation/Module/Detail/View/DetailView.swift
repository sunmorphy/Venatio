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
    @ObservedObject var viewModel: DetailViewModel
    
    var id: String
    
    var body: some View {
        ScrollView(.vertical) {
            switch viewModel.dataState {
            case .idle:
                EmptyView()
            case .loading:
                ProgressView()
            case .success(let game):
                VStack(alignment: .leading) {
                    ZStack {
                        SwiftUI.Color.clear.overlay {
                            KFImage.url(URL(string: game.image)).cacheMemoryOnly().fade(duration: 0.25).resizable()
                                .aspectRatio(contentMode: .fill)
                        }.clipped()
                        LinearGradient(gradient: Gradient(colors: [SwiftUI.Color.black.opacity(0.75), SwiftUI.Color.clear]), startPoint: .top, endPoint: .bottom)
                    }.frame(height: 256)
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading) {
                            HStack(alignment: .center) {
                                HStack(spacing: 8) {
                                    Image(systemName: "calendar").renderingMode(.template)
                                    Text(formatDateToMedium(dateFormat: "yyyy-MM-dd",date: game.released)).font(Font.caption2)
                                }
                                Spacer()
                                Text(String(game.rating)).font(Font.callout).fontWeight(.medium).padding(EdgeInsets.init(top: 4, leading: 4, bottom: 4, trailing: 4)).background(SwiftUI.Color.savoyBlue).clipShape(RoundedRectangle(cornerRadius: 8))
                            }
                            Text(game.name).font(Font.title).bold()
                        }
                        WrappingHStack(game.genres, id: \.self) { genre in
                            GenreRow(genre: genre.name).padding(EdgeInsets.init(top: 4, leading: 4, bottom: 4, trailing: 4))
                        }
                        Text(game.description).font(Font.subheadline).foregroundColor(.white.opacity(0.8))
                    }.padding(EdgeInsets.init(top: 12, leading: 18, bottom: 12, trailing: 18))
                    Spacer()
                }.foregroundColor(SwiftUI.Color.white).toolbar {
                    Button(action: {
                        viewModel.isGameFavorited ? viewModel.removeFavoriteGame(id: game.id) : viewModel.addFavoriteGame(game: GameModel(id: game.id, name: game.name, released: game.released, image: game.image, rating: game.rating))
                    }, label: {
                        Image(systemName: viewModel.isGameFavorited ? "heart.fill" : "heart")
                            .imageScale(.large)
                            .foregroundColor(.carnationPink)
                    })
                }
            case .error(message: let message):
                ErrorView(message: message)
            }
        }
        .onLoad {
            viewModel.fetchFavoriteGames(id: id)
        }
    }
}
