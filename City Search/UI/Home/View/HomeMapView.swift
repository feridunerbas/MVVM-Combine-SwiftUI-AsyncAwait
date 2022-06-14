//
//  HomeMapView.swift
//  City Search
//
//  Created by Feridun Erbas on 31.03.2022.
//

import SwiftUI
import MapKit

struct HomeMapView: View {
    
    // MARK: - Injected
    @StateObject var viewModel: HomeMapViewModel
    
    var body: some View {
        Map(
            coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.annotations,
            annotationContent: { (cityAnnotation) -> MapMarker in
                MapMarker(coordinate: cityAnnotation.coordinate.asCLLocationCoordinate2D())
            }
        ).animation(.default)
        
    }
}

struct HomeMapView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMapView(viewModel: HomeMapViewModel())
    }
}
