//
//  PreferencesScreen.swift
//  Maps
//
//  Created by Maksym Poskannyi on 04.06.2025.
//

import SwiftUI

struct PreferencesScreen: View {
    @AppStorage("useLightMap") var useLightMap: Bool = false
    @AppStorage("distanceUnit") var distanceUnit = DistanceUnit.kilometers
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Toggle(isOn: $useLightMap) {
                Text("Always use light map")
            }
            
            Divider()
            
            HStack {
                Text("Distance unit:")
                Spacer()
                Picker("", selection: $distanceUnit) {
                    ForEach(DistanceUnit.allCases, id: \.self) { unit in
                        Text(unit.title)
                    }
                }
            }.fixedSize()
                .padding(.trailing, 20)
            
        }.padding()
            .frame(minWidth: 400, minHeight: 400)
    }
}

#Preview {
    PreferencesScreen()
}
