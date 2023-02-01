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
    
    var body: some View {
        Text(results)
    }
}

//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView()
//    }
//}
