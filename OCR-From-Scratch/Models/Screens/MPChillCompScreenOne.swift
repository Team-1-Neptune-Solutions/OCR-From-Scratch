//
//  MPChillerCompressorScreenPageOne.swift
//  OCR-From-Scratch
//
//  Created by Will Paceley on 2023-01-31.
//

import Foundation

struct MPChillCompScreenOne: ParsableScreen {
    var id = UUID()
    var description = "Main Plant Chiller Compressor Page 1"
    
    func parse(results: [String]) -> String {
        var parsedResults = ""
        print("--- PRINTING RESULTS ---")
        for result in results {
            parsedResults += "\(result)\n"
        }
        
        print(parsedResults)
        return parsedResults
    }
}
