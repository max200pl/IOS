# Location in Swift

    In Swift, location services are primarily handled through the Core Location framework. This framework provides a way to obtain the geographic location and orientation of a device. It allows developers to access location data, monitor significant location changes, and handle geocoding and reverse geocoding.


## Key Concepts

- **requestAuthorization**: A method to request permission from the user to access their location data. This is essential for privacy and security reasons.

![RequestAuthorization](RequestAuthorization.png)

    ```swift
    import CoreLocation
    class LocationManager: NSObject, CLLocationManagerDelegate {
        let locationManager = CLLocationManager()

        func requestAuthorization() {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    ```

- **requestLocation**: A method to request the current location of the device. This method is used when you need a one-time location update.

    ```swift
    import CoreLocation
    class LocationManager: NSObject, CLLocationManagerDelegate {
        let locationManager = CLLocationManager()

        func requestLocation() {
            locationManager.requestLocation()
        }
    }
    ```