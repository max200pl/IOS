//
//  Extension.swift
//  Maps
//
//  Created by Maksym Poskannyi on 04.06.2025.
//

import Foundation
import AppKit
import SwiftUI

extension View {
    
    @discardableResult
    func openInWindwo(title: String, sender: Any?) -> NSWindow {
        let controller = NSHostingController(rootView: self)
        let window = NSWindow(contentViewController: controller)
        window.contentViewController = controller
        window.title = title
        window.makeKeyAndOrderFront(sender)
        
        return window
    }
}
