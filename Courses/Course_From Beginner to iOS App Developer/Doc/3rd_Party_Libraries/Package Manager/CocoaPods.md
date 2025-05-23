# CocoaPods

CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It simplifies integrating third-party libraries into your iOS projects.

## Installation
1. Open Terminal.
2. Install CocoaPods:
    ```bash
    sudo gem install cocoapods
    pod setup --verbose
    ```

## Podfile Overview
- **Podfile**: Specifies project dependencies.
- **Podspec**: Describes a Pod, including its name, version, and dependencies.

## Creating a Podfile
1. Navigate to your Xcode project directory in Terminal.
2. Create a Podfile:
    ```bash
    pod init
    ```
3. Open the Podfile:
    ```bash
    open -a Xcode Podfile
    ```

### Example Podfile
```ruby
platform :ios, '10.0'

target 'Flash Chat iOS13' do
  use_frameworks!

  pod 'CLTypingLabel', '~> 0.4.0'
end
```

## Installing Pods
1. Navigate to the project directory.
2. Install the pods:
    ```bash
    pod install
    ```

### Example Podfile for Another Project
```ruby
platform :ios, '9.0'

target 'Todoey' do
  use_frameworks!

  pod 'RealmSwift'
end
```
