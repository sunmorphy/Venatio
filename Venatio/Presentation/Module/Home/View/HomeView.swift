//
//  HomeView.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var detailViewModel: DetailViewModel
    @EnvironmentObject var favoriteViewModel: FavoriteViewModel
    @ObservedObject var viewModel: HomeViewModel
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, content: {
                    Text("Venatio")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink(destination: FavoriteView(viewModel: favoriteViewModel)) {
                        Image(systemName: "heart.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.carnationPink)
                    }
                    NavigationLink(destination: AboutView()) {
                        Image(systemName: "info.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.savoyBlue)
                    }
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
        .navigationTitle("Home")
        .onLoad {
            viewModel.fetchGames()
        }
    }
}
