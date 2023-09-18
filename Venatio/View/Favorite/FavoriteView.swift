//
//  FavoriteView.swift
//  Venatio
//
//  Created by user236913 on 9/17/23.
//

import SwiftUI

struct FavoriteView: View {
    @ObservedObject var viewModel = FavoriteViewModel()
    
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
                case .success(let results):
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(results, id: \.id) { game in
                                NavigationLink(destination: DetailView(id: String(game.id)), label: {
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

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
