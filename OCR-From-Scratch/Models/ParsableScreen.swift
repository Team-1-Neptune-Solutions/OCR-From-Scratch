//
//  ParsableScreen.swift
//  OCR-From-Scratch
//
//  Created by Will Paceley on 2023-01-31.
//

import Foundation

protocol ParsableScreen {
    var id : String { get }
    var description: String { get }
    func parse(results: [String]) -> String
}
