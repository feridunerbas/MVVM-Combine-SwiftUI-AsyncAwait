//
//  SearchView.swift
//  City Search
//
//  Created by Feridun Erbas on 1.04.2022.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - Injected Properties
    @StateObject var viewModel: SearchViewModel
    
    // MARK: - Properties
    @State private var searchText = ""
    @State private var textFieldId = UUID().uuidString
    
    // MARK: - Pass Actions
    var beginEditing: (Bool) -> Void
    
    var body: some View {
        ZStack {
            ZStack {
                VStack {
                    TextField("Search", text: $searchText, onEditingChanged: beginEditing)
                        .id(textFieldId)
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                        .onChange(of: searchText) {
                            search(text: $0)
                        }
                        .background(Color(UIColor.systemBackground))
                        .cornerRadius(6)
                    ScrollView() {
                        LazyVStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.cityRowViewModels) { city in
                                CityRowView(viewModel: city)
                                    .onTapGesture {
                                        viewModel.selected(cityRowViewModel: city)
                                        textFieldId = UUID().uuidString
                                    }
                            }
                        }
                    }
                }.padding(.all, 20)
            }.background(
                Color(UIColor.systemBackground.withAlphaComponent(0.8))
            ).cornerRadius(6)
        }
    }
    
    func search(text: String) {
        Task {
            try? await viewModel.loadCities(keyword: text)
        }
    }
}
