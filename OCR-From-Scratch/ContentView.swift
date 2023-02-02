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
    @State private var parsedResults = "Default results"
    @State var currentScreen: Screen?
    
    private var screens = ScreenFactory.all
    
    
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
            ResultsView(results: $parsedResults)
        }
        .onChange(of: scannedImage) { _ in
            if let image = scannedImage {
                processImage(image: image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private func processImage(image: UIImage) {
        guard let cgImage = image.cgImage else {
            print("Failed to get cgimage from input image")
            return
        }
        
        // Create a new image-request handler.
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)

        // Create a new request to recognize text.
        let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)

        do {
            // Perform the text-recognition request.
            try requestHandler.perform([request])
        } catch {
            print("Unable to perform the requests: \(error).")
        }
    }
    
    private func recognizeTextHandler(request: VNRequest, error: Error?) {
        guard let observations =
                request.results as? [VNRecognizedTextObservation] else {
            return
        }
        let recognizedStrings = observations.compactMap { observation in
            // Return the string of the top VNRecognizedText instance.
            return observation.topCandidates(1).first?.string
        }
        
        // Process the recognized strings.
        if let currentScreen {
            parsedResults = currentScreen.parse(results: recognizedStrings)
            showingResults = true
        }
    }
}


