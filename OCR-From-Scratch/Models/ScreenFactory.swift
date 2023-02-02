//
//  ScreenFactory.swift
//  OCR-From-Scratch
//
//  Created by AKSHAY MAHAJAN on 2023-02-02.
//

import Foundation

class ScreenFactory {
    static let all: [Screen] = [
        MPChillCompScreenOne(description: "Main Plant Chiller Compressor Page 1"),
        AbsorptionHome(description: "Absorption Home")
    ]
}
