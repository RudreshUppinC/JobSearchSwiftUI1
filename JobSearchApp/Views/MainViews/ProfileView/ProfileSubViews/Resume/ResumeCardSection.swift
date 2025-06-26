//
//  ResumeCardSection.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 26/06/25.
//

import SwiftUI

struct ResumeCardSection: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ResumeCardSection()
}

import SwiftUI

// MARK: 1. The Data Model
struct Resume: Identifiable {
    let id = UUID()
    let fileName: String
    let fileSizeInKB: Double
    let uploadDate: Date
    let fileType: String = "PDF"
}

// MARK: 2. The Reusable Row Component
struct ResumeItemView: View {
    let resume: Resume
    let onDelete: () -> Void
    
  
    
    var body: some View {
        HStack(spacing: 12) {
            // --- File Type Icon ---
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.red.opacity(0.8))
                    .frame(width: 50, height: 60)
                
                Text(resume.fileType)
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(.white)
            }
            
            // --- File Info ---
            VStack(alignment: .leading, spacing: 4) {
                Text(resume.fileName)
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(.black.opacity(0.9))
                Text("\(String(format: "%.0f", resume.fileSizeInKB)) Kb • \(resume.uploadDate.formattedForResumeUpload())")
                    .font(FontStyle.dmsansRegular.font(baseSize: 10))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // --- Delete Button ---
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .font(.title2)
                    .foregroundColor(.red)
            }
        }
    }
}


// MARK: 3. The Main Card View
struct ResumeCardView: View {
    let resumes: [Resume]
    let onAdd: () -> Void
    let onDelete: (Resume) -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // --- Header Section ---
            HStack {
                // I will add my image later
                Image(systemName: "person.text.rectangle")
                    .font(.title3)
                    .foregroundColor(.orange)
                
                Text("Resume")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color.black.opacity(0.8))
                
                Spacer()
                
                Button(action: onAdd) {
                    // I will add my image later
                    Image(systemName: "plus")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.orange)
                        .padding(8)
                        .background(Color.orange.opacity(0.15))
                        .clipShape(Circle())
                }
            }
            
            // --- List of Resumes ---
            VStack(spacing: 20) {
                // In a real app, you would have a ForEach loop here.
                // For this example, we show the first one if it exists.
                if let firstResume = resumes.first {
                    // Add a divider if there are items
                    Divider().padding(.vertical, 12)
                    
                    ResumeItemView(resume: firstResume) {
                        onDelete(firstResume)
                    }
                } else {
                    // Optional: Show a message if there are no resumes
                    Text("No resume uploaded.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 20)
                }
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, y: 5)
    }
}


// MARK: 4. Example Usage and Preview
struct ResumeExampleView: View {
    // Create some sample data to display
    @State private var sampleResumes: [Resume] = [
        Resume(
            fileName: "Jamet kudasi - CV - UI/UX Designer",
            fileSizeInKB: 867,
            uploadDate: Date() // Using current date for simplicity
        )
    ]
    
    var body: some View {
        ZStack {
            // A background to make the card stand out
            Color(UIColor.systemGray6).ignoresSafeArea()
            
            ResumeCardView(
                resumes: sampleResumes,
                onAdd: {
                    print("Add new resume tapped!")
                },
                onDelete: { resumeToDelete in
                    print("Delete tapped for: \(resumeToDelete.fileName)")
                    // In a real app, you'd remove it from the array
                    // sampleResumes.removeAll { $0.id == resumeToDelete.id }
                }
            )
            .padding()
        }
    }
}

// MARK: - Preview
struct ResumeExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeExampleView()
    }
}
