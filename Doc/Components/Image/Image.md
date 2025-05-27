# Image in SwiftUI

## Image
```swift
import SwiftUI
struct ImageExample: View {
    var body: some View {
        VStack {
            // Local image
            Image("localImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)

            // Remote image
            AsyncImage(url: URL(string: "https://example.com/image.jpg")) { image in
                image.resizable()
                     .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
        }
    }
}
```