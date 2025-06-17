# Configuration project in Swift

## Overview
This project is a Swift package that provides a simple way to manage configuration settings in your application. It allows you to define configuration options, load them from various sources, and access them throughout your codebase.

## Features
- Define configuration options with default values
- Load configuration from JSON, plist, or environment variables
- Access configuration options in a type-safe manner

## Plist Configuration
To use a plist file for configuration, you can create a `Config.plist` file in your project. The file should contain key-value pairs representing your configuration options.

[Examples](https://habr.com/ru/articles/704536/)

## XCConfig Configuration
To use an `.xcconfig` file for configuration, create a file named `Config.xcconfig` in your project. This file can contain key-value pairs that define your configuration options. You can then reference these options in your Swift code.
