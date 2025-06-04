//
//  RoutePopover.swift
//  Maps
//
//  Created by Maksym Poskannyi on 03.06.2025.
//

import Foundation
import AppKit

class RoutePopover: NSPopover {
    
    init(controller: RouteContentViewController) {
        super.init()
        self.contentViewController = controller
        self.contentSize = controller.view.frame.size
        self.behavior = .transient
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
