//
//  SearchResultsViewModel.swift
//  Maps
//
//  Created by Maksym Poskannyi on 03.06.2025.
//

import Foundation
import MapKit

class SearchResultsViewModel {
    private var locationMangager = LocationManager()
    
    func search(text: String, completion: @escaping ([PlaceAnnotation]) -> Void) {
        if text.count < 4 {
            completion([])
            return
        }
        
        let searachRequest = MKLocalSearch.Request()
        searachRequest.naturalLanguageQuery = text
        searachRequest.region = locationMangager.region
        
        let search = MKLocalSearch(request: searachRequest)
        
        search.start { response, error in
            guard let response = response, error == nil else {
                print("Error: \(error?.localizedDescription ?? "No description")")
                return
            }
            
            let places = response.mapItems.map(PlaceAnnotation.init)
            completion(places)
        }
    }
}
