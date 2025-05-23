//
//  Category.swift
//  Todoey
//
//  Created by Maksym Poskannyi on 23.05.2025.
//  Copyright © 2025 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    
    let items = List<Item>() //! Realm List
}
