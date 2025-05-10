# 3rd Party Libraries in iOS

## CocoaPods
CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It simplifies the process of integrating third-party libraries into your iOS projects. With CocoaPods, you can easily add, update, and manage libraries in your Xcode projects.
### Installation
1. Open Terminal.
2. Install CocoaPods using the following command:
   ```bash
   sudo gem install cocoapods // This command installs CocoaPods using RubyGems.
   ```
   pod setup --verbose // This command sets up the CocoaPods environment.
   pod update // This command updates the local CocoaPods repository.
   ```

### Pod overview
- **Podfile**: A file that specifies the dependencies for your project. It contains a list of libraries and their versions.
- **Podspec**: A specification file that describes a Pod, including its name, version, source files, and dependencies.

### Creating a Podfile
1. Navigate to your Xcode project directory in Terminal.
2. Run the following command to create a Podfile:
   ```bash
   pod init
   ```
3. Open the Podfile using a text editor:
   ```bash
   open -a Xcode Podfile
   ```