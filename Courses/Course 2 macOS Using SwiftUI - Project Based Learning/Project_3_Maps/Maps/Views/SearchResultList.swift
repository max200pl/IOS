//
//  SearchResultList.swift
//  Maps
//
//  Created by Maksym Poskannyi on 01.06.2025.
//

import SwiftUI

struct SearchResultList: View {
    
    let places: [PlaceAnnotation]
    var onSelect: (PlaceAnnotation) -> Void
    
    @StateObject private var locationManager = LocationManager()
    @AppStorage("distanceUnit") var distanceUnit: DistanceUnit = .miles
    
    private var distanceFormatter = DistanceFormatter()
    
    init(places: [PlaceAnnotation], onSelect: @escaping (PlaceAnnotation) -> Void) {
        self.places = places
        self.onSelect = onSelect
    }
    
    func formatDistance(for place: PlaceAnnotation) -> String {
        guard let distanceInMetters = place.getDistance(userLocation: locationManager.location)
        else { return "Unknown"}
        
        distanceFormatter.unitOptions = distanceUnit
        return distanceFormatter.format(distanceInMeters: distanceInMetters)
    }
    
    var body: some View {
        List(places) { place in
            VStack(alignment: .leading) {
                Text(place.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(formatDistance(for: place))
                    .font(.caption)
                    .opacity(0.4)
            }
            .contentShape(Rectangle())
            .onTapGesture {
                onSelect(place)
            }
        }
    }
}

#Preview {
    SearchResultList(places: [], onSelect: { _ in })
}
