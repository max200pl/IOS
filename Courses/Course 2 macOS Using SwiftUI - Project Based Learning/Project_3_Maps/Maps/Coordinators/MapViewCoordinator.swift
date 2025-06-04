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
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? PlaceAnnotation else { return }
        
        view.canShowCallout = true
        view.detailCalloutAccessoryView =
            PlaceCalloutView(
                annotation: annotation,
                selctShowDirections: { [weak self] place in
                    let start = MKMapItem.forCurrentLocation()
                    let distanation = MKMapItem(placemark: MKPlacemark(coordinate: place.coordinate))
                    
                    self?.calculateRoute(start: start, destination: distanation) { route in
                        
                        if let route = route {
                            view.detailCalloutAccessoryView = nil
                            
                            let controller = RouteContentViewController(route: route)
                            let routePopover = RoutePopover(controller: controller)
                            
                            let positionView = NSView(frame: NSRect(x: mapView.frame.width/2.6, y:0, width: mapView.frame.width/2, height: 30.0))
                            
                            mapView.addSubview(positionView)
                            
                            // Clear all overlays
                            mapView.removeOverlays(mapView.overlays)
                            
                            // Add overlay on the map
                            mapView.addOverlay(route.polyline, level: .aboveRoads)
                            
                            
                            routePopover.show(relativeTo: positionView.frame, of: positionView, preferredEdge: .maxY)
                        }
                    }
                }
        )
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.lineWidth  = 5.0
        renderer.strokeColor = NSColor.purple
        
        return renderer
    }
    
    func calculateRoute(start: MKMapItem, destination: MKMapItem, completion: @escaping (MKRoute?) -> Void){
        let directionsRequest = MKDirections.Request()
        
        directionsRequest.transportType = .automobile
        directionsRequest.source = start
        directionsRequest.destination = destination
        
        let directions = MKDirections(request: directionsRequest)
        
        directions.calculate { respons, error in
            if let error = error {
                print("Error calculating directions: \(error)")
                return
            }
            
            guard let response = respons,
                  let route = response.routes.first else {
                    return
                }
            
             completion(route)
        }
    }
    
}
