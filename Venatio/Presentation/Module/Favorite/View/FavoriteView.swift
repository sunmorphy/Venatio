//
//  FavoriteView.swift
//  Venatio
//
//  Created by user236913 on 9/17/23.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var detailViewModel: DetailViewModel
    @ObservedObject var viewModel: FavoriteViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, content: {
                    Text("Favorite")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                    Spacer()
                    Button(action: {
                        viewModel.fetchFavoriteGames()
                    }, label: {
                        Image(systemName: "arrow.clockwise.circle.fill").renderingMode(.template)
                    })
                }).padding()
                switch viewModel.dataState {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .success(let games):
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(games, id: \.id) { game in
                                NavigationLink(destination: DetailView(viewModel: detailViewModel, id: String(game.id)), label: {
                                    GameRow(game: game)
                                })
                            }
                        }
                    }
                case .error(message: let message):
                    ErrorView(message: message)
                }
            }
        }
        .onLoad {
            viewModel.fetchFavoriteGames()
        }
    }
}
