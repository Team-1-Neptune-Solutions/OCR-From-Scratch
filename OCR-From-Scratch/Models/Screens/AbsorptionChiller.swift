//
//  AbsorptionChiller.swift
//  OCR-From-Scratch
//
//  Created by AKSHAY MAHAJAN on 2023-02-04.
//

import Foundation

struct AbsorptionChiller: ParsableScreen {
    let id = UUID().uuidString
    let description = "Absorption Chiller"
    
    func parse(results: [String]) -> String {
        var values = [Double]()
        var parsedResults = ""
        print("--- PRINTING RESULTS ---")
        for result in results {
            if let value = Double(result){
                values.append(value)
                parsedResults += "\(result),"
            }
        }
        print(parsedResults)
        return parsedResults
    }
}
