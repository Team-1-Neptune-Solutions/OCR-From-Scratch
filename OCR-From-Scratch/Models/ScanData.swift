//
//  File.swift
//  OCR-From-Scratch
//
//  Created by Will Paceley on 2023-02-01.
//
// ScannerView code derived from Vision tutorial by Recoding on Youtube
// URL here: https://youtu.be/Ru0bEvYiQ_Q

import Foundation

struct ScanData: Identifiable {
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
    }
}
