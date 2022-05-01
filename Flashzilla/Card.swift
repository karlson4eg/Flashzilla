//
//  Card.swift
//  Flashzilla
//
//  Created by Evi St on 4/30/22.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    
}

