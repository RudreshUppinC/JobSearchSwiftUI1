//
//  UpLoadFileViewModal.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 27/02/25.
//

import Foundation
import Combine

class UploadCVViewModel: ObservableObject {
    
    @Published var isDescriptiveView: Bool = false

    @Published var hasCVUploaded: Bool = false
    @Published var isUploading: Bool = false
    @Published var progress: Double = 0.0
    @Published var isCompanyScreenSuccessView = false
    @Published var isUploadFileScreen = false

    @Published var isHideApplyButtonIn = false

    
    @Published var cvFileName: String = ""
    @Published var cvFileSize: String = ""
    @Published var cvUploadDate: String = ""
    @Published var errorMessage: String? = nil

    func startUploading(fileURL: URL) {
        // Reset error message
        errorMessage = nil
        isUploading = true
        progress = 0.0

        cvFileName = fileURL.lastPathComponent // Get the file name

        // Get file size
        do {
            let resources = try fileURL.resourceValues(forKeys:[.fileSizeKey])
            let fileSize = resources.fileSize!
            cvFileSize = String(format: "%.0f Kb", Double(fileSize) / 1024.0) // Format as KB
        } catch {
            print("Error getting file size: \(error)")
            cvFileSize = "Unknown"
            uploadFailed(error: "Error getting file size") //Delegate error handling
            return
        }

        // Get upload date (using current date and time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy 'at' hh:mm a"
        cvUploadDate = dateFormatter.string(from: Date())


        // Simulate upload progress
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if self.progress < 100.0 {
                self.progress += 2.8
            } else {
                timer.invalidate()
                self.isUploading = false
                self.hasCVUploaded = true
                // You would typically upload the file to your server here.
                 print("File uploaded: \(fileURL)")
            }
        }
    }

    // Error Handling Functions:  These centralize the error handling
    func uploadFailed(error: String) {
        errorMessage = error
        isUploading = false
        print("Upload failed: \(error)")
    }

    func uploadCancelled() {
        errorMessage = "Upload cancelled"
        isUploading = false
        print("Upload cancelled")
    }
}
