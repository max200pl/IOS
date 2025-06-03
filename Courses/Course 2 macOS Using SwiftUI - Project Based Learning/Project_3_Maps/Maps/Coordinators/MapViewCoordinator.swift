//
//  MapViewCoordinator.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import Foundation
import MapKit

final class MapViewCoordinator: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
        
        mapView.setRegion(region, animated: true)
    }
    
}
