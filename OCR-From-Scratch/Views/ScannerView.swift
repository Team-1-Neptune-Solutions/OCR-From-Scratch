//
//  ScannerView.swift
//  OCR-From-Scratch
//
//  Created by Will Paceley on 2023-01-31.
//
// ScannerView code derived from Vision tutorial by Recoding on Youtube
// URL here: https://youtu.be/Ru0bEvYiQ_Q


import VisionKit
import SwiftUI

struct ScannerView {
    private let completionHandler: ([String]?) -> Void
    
    init(completion: @escaping ([String]?) -> Void) {
        self.completionHandler = completion
    }
}

extension ScannerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = VNDocumentCameraViewController
    
    // SwiftUI calls this method a single time when it’s ready to display the view
    // then manages the view controller’s life cycle.
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
    }
    
}

extension ScannerView {
    // A SwiftUI view that represents a UIKit view controller can define a Coordinator type
    // that SwiftUI manages and provides as part of the representable view’s context.
    
    // SwiftUI manages your UIViewControllerRepresentable type’s coordinator
    // and provides it as part of the context when calling the methods above.
    final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        private let completionHandler: ([String]?) -> Void
        
        init(completion: @escaping ([String]?) -> Void) {
            self.completionHandler = completion
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            print("Document camera view controller did finish with ", scan)
            let recognizer = TextRecognizer(cameraScan: scan)
            recognizer.recognizeText(withCompletionHandler: completionHandler)
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            completionHandler(nil)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            completionHandler(nil)
        }
    }
    
    // SwiftUI calls this makeCoordinator() method before makeUIViewController(context:)
    // which grants access to the coordinator object when configuring your view controller.
    
    // You can use this coordinator to implement common Cocoa patterns
    // e.g. delegates, data sources, and responding to user events via target-action.
    func makeCoordinator() -> Coordinator {
        return Coordinator(completion: completionHandler)
    }
}
