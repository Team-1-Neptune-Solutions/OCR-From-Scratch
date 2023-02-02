//
//  Screen.swift
//  OCR-From-Scratch
//
//  Created by AKSHAY MAHAJAN on 2023-02-02.
//

import Foundation

class Screen: Identifiable {
    var id = UUID()
    var description: String
    
    func parse(results: [String]) -> String {
        return "NOT OVERRIDDEN"
    }
    
    init(description: String) {
        self.description = description
    }
}
