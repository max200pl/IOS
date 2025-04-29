# Slider in SwiftUI

## Overview
The `Slider` is a control that allows the user to select a value from a continuous range of values. It is commonly used for adjusting settings such as volume, brightness, or any other parameter that can be represented as a numeric value.

## Basic Usage

```swift

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Double = 50.0

    var body: some View {
        VStack {
            Text("Slider Value: \(sliderValue, specifier: "%.2f")")
                .padding()

            Slider(value: $sliderValue, in: 0...100, step: 1)
                .padding()
        }
    }
}