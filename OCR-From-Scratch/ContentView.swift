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
    @State private var showingScanner = false
    
    let screens = [MPChillCompScreenOne()]
    
    var body: some View {
        VStack {
            List(screens) { screen in
                Button(screen.description) {
                    showingScanner = true
                }
            }
        }
        .sheet(isPresented: $showingScanner) {
            ScannerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
