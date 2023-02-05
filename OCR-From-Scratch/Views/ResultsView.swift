//
//  ResultsView.swift
//  OCR-From-Scratch
//
//  Created by Will Paceley on 2023-01-31.
//

import SwiftUI
import Vision

struct ResultsView: View {
    @Binding var results: String
    @State var exportStatus:Bool = false
    
    var body: some View {
        VStack{
            Text(results)
            if(exportStatus){
                Text("Data exported successfully!")
            }else{
                Button("Export to csv",action: exportToCSV)
            }
            
        }
        
    }
}
extension ResultsView{
    private func exportToCSV(){
        let headers = "Vacuum,Tank Side Start, Tank Side Stop, Ultimate Vacuum, Vacuum Check Interval\n"
        let data = "\(results)\n"
        let fileName = "log.csv"
        
        let csvString = headers + data
        
        do{
//            try FileManager.default.createDirectory(atPath: folderPath, withIntermediateDirectories: true, attributes: nil)
            //Store csv to Documents
            let documents = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil,create: false)
            let file = documents.appendingPathComponent(fileName)
            
            //try writing to the file path
            try csvString.write(to: file, atomically: true, encoding: .utf8)
            exportStatus = true
        }catch{
            print("creating csv failed \(error)")
        }
    }
}
//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//    }
//}
