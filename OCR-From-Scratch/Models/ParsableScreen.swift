//
//  ParsableScreen.swift
//  OCR-From-Scratch
//
//  Created by Will Paceley on 2023-01-31.
//

import Foundation

protocol ParsableScreen: Identifiable {
    var description: String { get set }
    func parse() -> Void
}
