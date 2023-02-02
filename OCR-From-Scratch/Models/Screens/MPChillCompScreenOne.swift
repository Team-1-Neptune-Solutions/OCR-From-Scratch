//
//  MPChillerCompressorScreenPageOne.swift
//  OCR-From-Scratch
//
//  Created by Will Paceley on 2023-01-31.
//

import Foundation

class MPChillCompScreenOne: Screen {
    
    let labels = [
        "Compressor Starts",
        "Running Time",
        "Oil Tank Discharge Pressure",
        "Oil Differential Pressure"
    ]
    
    override init(description: String) {
        super.init(description: description)
    }
    
    // WP Note - We need these values:
    // Compressor Starts
    // Running Time
    // Oil Tank Discharge Pressure
    // Oil Differential Pressure
    
    override func parse(results: [String]) -> String {
        var myValues = [String]()
        var ourFloats = [Float]()
        
        var parsedResults = ""
        print("--- PRINTING RESULTS ---")
        for result in results {
            if result.contains("Min") {
                myValues.append(result)
            } else if result.contains("PSIG") {
                let splitResult = result.split(separator: " ")
                if let ourNum = Float(splitResult[0]) {
                    if ourNum > 0 {
                        ourFloats.append(ourNum)
                    }
                }
                myValues.append(result)
            } else if result.contains("PSID") {
                myValues.append(result)
            }
            
            parsedResults += "\(result)\n"
        }
        
        print(parsedResults)
        print(myValues)
        print(ourFloats)
        return parsedResults
    }
}
