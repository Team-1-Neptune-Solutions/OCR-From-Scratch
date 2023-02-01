//
//  ContentView.swift
//  OCR-From-Scratch
//
//  Created by Kiefer Baird-Perry on 2023-01-27.
//

import SwiftUI
import VisionKit
import Vision

struct ContentView: View {
    let screens = [MPChillCompScreenOne()]
    
    var body: some View {
        NavigationStack {
            List(screens) { screen in
                NavigationLink(screen.description) {
                    ResultsView()
                }
            }
        }
        .navigationTitle("HMI Scanner Demo")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    
}
