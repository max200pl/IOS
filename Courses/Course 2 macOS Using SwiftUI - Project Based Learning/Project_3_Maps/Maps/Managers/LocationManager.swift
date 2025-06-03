//
//  LocationManager.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import Foundation
import CoreLocation
import MapKit

public class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocation?
    @Published var region: MKCoordinateRegion = MKCoordinateRegion()
    
    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLHeadingFilterNone
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
    }
}

extension LocationManager: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        
        guard let location = locations.first else { return }
        
        DispatchQueue.main.async { [weak self] in
            self?.location = location
            self?.region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)
        }
    }
}

