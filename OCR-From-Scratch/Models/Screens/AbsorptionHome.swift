//
//  AbsorptionHome.swift
//  OCR-From-Scratch
//
//  Created by AKSHAY MAHAJAN on 2023-02-02.
//

import Foundation

class AbsorptionHome: Screen {
    
//    let labels = [
//        "Compressor Starts",
//        "Running Time",
//        "Oil Tank Discharge Pressure",
//        "Oil Differential Pressure"
//    ]
//
    override init(description: String) {
        super.init(description: description)
    }
    
    override func parse(results: [String]) -> String {
//        var myValues = [String]()
        var values = [Double]()
        
        var parsedResults = ""
        print("--- PRINTING RESULTS ---")
        
        for result in results {
            if let value = Double(result){
                values.append(value)
                parsedResults += "\(result)\n"
            }
            
        }
//        for (index, result) in results.enumerated() {
//            if result.contains("Min") {
//                myValues.append(result)
//            } else if result.contains("PSIG") {
//                let splitResult = result.split(separator: " ")
//                if let ourNum = Float(splitResult[0]) {
//                    if ourNum > 0 {
//                        ourFloats.append(ourNum)
//                    }
//                }
//                myValues.append(result)
//            } else if result.contains("PSID") {
//                myValues.append(result)
//            }
//
//            parsedResults += "\(result)\n"
//        }
//
//        print(parsedResults)
//        print(myValues)
//        print(ourFloats)
        return parsedResults
    }
}
