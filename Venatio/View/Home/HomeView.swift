//
//  HomeView.swift
//  Venatio
//
//  Created by user236913 on 9/15/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, content: {
                    Text("Venatio")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink(destination: AboutView()) {
                        Image(systemName: "info.circle.fill")
                            .imageScale(.large)
                            .foregroundColor(.savoyBlue)
                    }
                }).padding()
                switch viewModel.dataState {
                case .Idle:
                    EmptyView()
                case .Loading:
                    ProgressView()
                case .Success(let data):
                    ScrollView(.vertical) {
                        VStack {
                            ForEach(data.results, id: \.id) { game in
                                NavigationLink(destination: DetailView(id: String(game.id)), label: {
                                    GameRow(game: game)
                                })
                            }
                        }
                    }
                case .Error(message: let message):
                    ErrorView(message: message)
                }
            }.onAppear {
                viewModel.fetchGames()
            }
        }.navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
