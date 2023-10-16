//
//  DataScannerView.swift
//  IosTranslator
//
//  Created by Lukáš Pisarčík on 16/10/2023.
//

import Foundation
import SwiftUI
import VisionKit

struct DataScannerView: UIViewControllerRepresentable {
    
    @Binding var recognizedItems: [RecognizedItem]
    @EnvironmentObject var viewModel: TranslateViewViewModel
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let vc = DataScannerViewController(
            recognizedDataTypes: [.text()],
            qualityLevel: .balanced,
            recognizesMultipleItems: false,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true
        )
        return vc
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        uiViewController.delegate = context.coordinator
        try? uiViewController.startScanning()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(recognizedItems: $recognizedItems, viewModel: viewModel)
    }
    
    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
        uiViewController.stopScanning()
    }
    
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        
        @Binding var recognizedItems: [RecognizedItem]
        let viewModel: TranslateViewViewModel

        init(recognizedItems: Binding<[RecognizedItem]>, viewModel: TranslateViewViewModel) {
            self._recognizedItems = recognizedItems
            self.viewModel = viewModel
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            print("didTapOn \(item)")
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            UINotificationFeedbackGenerator().notificationOccurred(.success)
            recognizedItems.append(contentsOf: addedItems)
//            print("didAddItems \(addedItems)")
            updateTranslation()
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            self.recognizedItems = recognizedItems.filter { item in
                !removedItems.contains(where: {$0.id == item.id })
            }
//            print("didRemovedItems \(removedItems)")
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
            print("became unavailable with error \(error.localizedDescription)")
        }
        
        func updateTranslation() {
            viewModel.inputText = generateInputString() // recocnized items
            viewModel.translate()
        }
        
        func generateInputString() -> String {
            return recognizedItems.map { item -> String in
                switch item {
                case .barcode(let barcode):
                    return barcode.payloadStringValue ?? "Unknown barcode"
                case .text(let text):
                    return text.transcript
                @unknown default:
                    return "Unknown"
                }
            }.joined(separator: " ")
        }
        
    }
}
