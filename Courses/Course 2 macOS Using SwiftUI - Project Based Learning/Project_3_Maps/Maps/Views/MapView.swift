//
//  MapView.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: NSViewRepresentable {
    // какой тип нам нужно показазать
    typealias NSViewType = MKMapView
    
    func makeNSView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        
        map.delegate = context.coordinator
        return map
    }
    
    func updateNSView(_ nsView: MKMapView, context: Context) {
        
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator()
    }
}
