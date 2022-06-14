//
//  HomeView.swift
//  City Search
//
//  Created by Feridun Erbas on 30.03.2022.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    // MARK: - Injected Properties
    @StateObject var viewModel: HomeViewModel
    
    // MARK: - Properties
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            HomeMapView(viewModel: viewModel.makeMapViewModel())
                .ignoresSafeArea()
            VStack () {
                Spacer()
                HStack {
                    SearchView(viewModel: viewModel.makeSearchViewModel(), beginEditing: {_ in
                        viewModel.searchMinimized = false
                    })
                }.frame(maxHeight: viewModel.searchMinimized
                        ? 150
                        : .infinity)
                    .animation(.default)
                
            }.ignoresSafeArea(.container, edges: .bottom)
            ProgressView("Loading")
                .progressViewStyle(CircularProgressViewStyle())
                .isHidden(!viewModel.isLoading)
        }.onAppear {
            prepare()
        }
    }
    
    func prepare() {
        Task {
            try? await viewModel.prepare()
        }
    }
        
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MakeHomeView()()
    }
}
