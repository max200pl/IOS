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
    
    // полученные данные с серчбара
    private var annotations: [PlaceAnnotation] = []
    private var selectedPlace: PlaceAnnotation?
    
    init(annotations: [PlaceAnnotation], selectedPlace: PlaceAnnotation?) {
        self.annotations = annotations
        self.selectedPlace = selectedPlace
    }
    
    func makeNSView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        
        map.delegate = context.coordinator
        return map
    }
    
    func updateNSView(_ map: MKMapView, context: Context) {
        // Remove all Annotations
        
        map.removeAnnotations(map.annotations)
        
        // add Annotations
        
        map.addAnnotations(annotations)
        
        if let selectedPlace = selectedPlace {
            map.selectAnnotation(selectedPlace, animated: true)
        }
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator()
    }
}
