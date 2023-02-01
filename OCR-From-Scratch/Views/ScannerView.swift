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

struct ScannerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = VNDocumentCameraViewController
    
    // A SwiftUI view that represents a UIKit view controller can define a Coordinator type
    // that SwiftUI manages and provides as part of the representable view’s context.
    // SwiftUI manages your UIViewControllerRepresentable type’s coordinator
    // and provides it as part of the context when calling the methods above.
    final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var parent: ScannerView
        
        init(_ parent: ScannerView) {
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            print("Document camera view controller did finish with ", scan)
            controller.dismiss(animated: true) {
                let image = scan.imageOfPage(at: 0)
                self.parent.scannedImage = image
            }
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("CameraViewController failed with error: \(error)")
            controller.dismiss(animated: true)
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            print("User cancelled taking photo")
            controller.dismiss(animated: true)
        }
    }
    
    // SwiftUI calls this makeCoordinator() method before makeUIViewController(context:)
    // which grants access to the coordinator object when configuring your view controller.
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    @Binding var scannedImage: UIImage?
    
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
