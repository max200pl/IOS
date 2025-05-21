//
//  ItemModel.swift
//  Todoey
//
//  Created by Maksym Poskannyi on 21.05.2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation

class Item: Encodable, Decodable { // Codable, Decodable
    var title: String = ""
    var done: Bool = false
}
