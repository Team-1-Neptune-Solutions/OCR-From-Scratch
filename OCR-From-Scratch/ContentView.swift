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
    @State private var showingResults = false
    @State private var scannedImage: UIImage?
    @State var currentScreen: (any ParsableScreen)?
    
    let screens = [MPChillCompScreenOne()]
    
    
    var body: some View {
        VStack {
            List(screens) { screen in
                Button(screen.description) {
                    currentScreen = screen
                    showingScanner = true
                }
            }
        }
        .sheet(isPresented: $showingScanner) {
            ScannerView(scannedImage: $scannedImage)
        }
        .sheet(isPresented: $showingResults) {
            ResultsView()
        }
        .onChange(of: scannedImage) { _ in
            showingResults = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
