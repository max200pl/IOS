//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Maksym Poskannyi on 28.04.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: String
    
    init(q: String, a: String) {
        self.text = q
        self.answers = a
    }
}
