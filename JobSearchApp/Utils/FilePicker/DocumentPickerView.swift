//
//  DocumentPickerView.swift
//  JobSearchApp
//
//  Created by Way2 on 03/03/25.
//

import SwiftUI
import UIKit
import UniformTypeIdentifiers

struct DocumentPickerView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    var viewModel: UploadCVViewModel 
    
    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var viewModel: UploadCVViewModel
        
        init(viewModel: UploadCVViewModel) {
            self.viewModel = viewModel
        }
        
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            // Handle the picked document(s)
            if let url = urls.first {
                // Handle the file URL, e.g., pass it to your view model
                viewModel.startUploading(fileURL:  url)
            }
        }
        
        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            // Handle cancellation if needed
            viewModel.uploadFailed(error: "Document picker was cancelled.")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(viewModel: viewModel)
    }
    
    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [
            UTType.pdf,
            UTType.rtf,
            UTType.plainText,
            UTType.compositeContent
        ], asCopy: true)
        documentPicker.delegate = context.coordinator
        documentPicker.modalPresentationStyle = .fullScreen
        return documentPicker
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: Context) {
    }
}
