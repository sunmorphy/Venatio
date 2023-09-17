//
//  ViewModule.swift
//  Venatio
//
//  Created by user236913 on 9/16/23.
//

import Foundation

struct ViewModule {
    var detailView: DetailView {
        DetailView(viewModel: detailViewModel, id: <#T##String#>)
    }
    private var detailViewModel: DetailViewModel {
        DetailViewModel()
    }
}
