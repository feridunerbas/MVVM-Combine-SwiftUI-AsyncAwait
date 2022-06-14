//
//  CityRowView.swift
//  City Search
//
//  Created by Feridun Erbas on 30.03.2022.
//

import SwiftUI

struct CityRowView: View {
    
    @StateObject var viewModel: CityRowViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            VStack(alignment: .leading, spacing: 2) {
                Text(viewModel.title).font(.system(.title))
                Text(viewModel.subtitle).font(.system(.subheadline)).foregroundColor(.gray)
            }
        }
    }
}

struct CityRowView_Previews: PreviewProvider {
    static var previews: some View {
        let city = City(id: 1, name: "Yozgat", country: "tr", coordinate: .init(latitude: 26, longitude: 36))
        let viewModel = CityRowViewModel(city: city)
        return CityRowView(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
