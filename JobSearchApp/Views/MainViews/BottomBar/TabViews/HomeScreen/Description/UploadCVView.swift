//
//  UploadCVView.swift
//  JobSearchApp
//
//  Created by Rudresh Jaya on 05/03/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct UploadCVView: View {
    let job: Jobs
    @StateObject private var viewModal = UploadCVViewModel()
    @Environment (\.presentationMode) var presentationMode
    
    @ViewBuilder
    func conditionalViews(isCompanyScreenSuccessView: Bool, viewModel: UploadCVViewModel) -> some View {
        
        if  isCompanyScreenSuccessView {
            UploadCVSuccessView(viewModal: viewModal)
        } else {
            MainUploadCVView(viewModel: viewModel)
                .padding(.horizontal, 10)
        }
        
    }
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.whisperGray.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            ImageProvider.getImage(named: "BackArrow").map{ image in
                                Image(uiImage: image)
                            }
                        }
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    ScrollView{
                        
                        VStack{
                            VStack(alignment: .center, spacing: 16) {
                                // Header
                                HeaderView(job:job)
                                
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            
                        }
                        
                        conditionalViews(isCompanyScreenSuccessView:viewModal.isCompanyScreenSuccessView , viewModel: viewModal)
                        
                    }
                    .background(AppColors.whisperGray)
                    
                    if !viewModal.isHideApplyButtonIn {
                        VStack {
                            Button(action: {
                                viewModal.isCompanyScreenSuccessView = true
                                viewModal.isHideApplyButtonIn = true
                            }) {
                                Text("APPLY NOW")
                                    .foregroundColor(AppColors.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(AppColors.blueColor)
                                    .cornerRadius(8)
                            }
                            .padding(.horizontal, 15)
                            
                        }
                        .padding(.horizontal, 15)
                    }
                    
                }
            }
        }        .navigationBarBackButtonHidden(true)
        
        
    }
        
}

struct MainUploadCVView: View {
    
    
    @ObservedObject var viewModel: UploadCVViewModel
    @State private var isDocumentPickerPresented = false
    
    var body: some View {
        
        // Upload CV Section
        VStack(alignment: .leading) {
            Text("Upload CV")
                .font(FontStyle.dmsansBold.font(baseSize: 14))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom, 5)
            Text("Add your CV/Resume to apply for a job")
                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                .foregroundColor(AppColors.dustyLavender)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 15)
        
        VStack() {
            if viewModel.hasCVUploaded {
                UploadedCVView(fileName: viewModel.cvFileName, fileSize: viewModel.cvFileSize, uploadDate:  viewModel.cvUploadDate, deleteButtonColor: .red, onDelete: {
                    viewModel.hasCVUploaded = false
                })
            } else {
                if viewModel.isUploading {
                    
                    VStack {
                        ProgressBar(progress: $viewModel.progress)
                            .frame(height: 10)
                        
                        Text("\(Int(viewModel.progress))%")
                            .font(.headline)
                            .foregroundColor(AppColors.deepIndigo)
                            .padding(.top, 5)
                    }
                    
                } else {
                    UploadCVButton {
                        viewModel.hasCVUploaded = false
                        isDocumentPickerPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isDocumentPickerPresented) {
                        DocumentPickerView(isPresented: $isDocumentPickerPresented, viewModel: viewModel)
                    }
                }
            }
        }
        .padding()
        
        // Information Section
        VStack(alignment: .leading) {
            Text("Information")
                .font(FontStyle.dmsansBold.font(baseSize: 14))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom, 5)
            
            TextEditor(text: .constant("Explain why you are the right person for this job"))
                .font(FontStyle.dmsansRegular.font(baseSize: 12))
                .foregroundColor(AppColors.paleLavender)
                .frame(height: 232)
                .padding(5)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(AppColors.white)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.clear, lineWidth: 0)
                )
        }
        .padding()
        
        Spacer()
        
        
    }
    
}



struct UploadCVButton: View {
    let onUpload: () -> Void
    
    var body: some View {
        Button(action: {
            onUpload()
            
        }) {
            HStack {
                ImageProvider.getImage(named: "uploadImage").map{ image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                }
                
                Text("Upload CV/Resume")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
            }
            .padding()
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: 75)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [3]))
                .foregroundColor(AppColors.dustyLavender)
        )
        .foregroundColor(.gray)
    }
    
    
}

// UploadedCVView
struct UploadedCVView: View {
    let fileName: String
    let fileSize: String
    let uploadDate: String
    let deleteButtonColor: Color
    let onDelete: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                ImageProvider.getImage(named: "PDF").map{ image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                }
                VStack(alignment: .leading) {
                    Text(fileName)
                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                        .foregroundColor(AppColors.darkIndigoColor)
                        .lineLimit(1)
                    Text("\(fileSize) - \(uploadDate)")
                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                        .foregroundColor(AppColors.paleLavender)
                }
                Spacer()
            }
            .padding()
            .background(Color("slightPink"))
            
            Button(action: {
                onDelete()
                print("Delete file button tapped")
            }) {
                HStack {
                    ImageProvider.getImage(named: "deleteIcon").map{ image in
                        Image(uiImage: image)
                            .foregroundColor(AppColors.lightCoral)
                    }
                    Text("Remove file")
                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                        .foregroundColor(AppColors.pureRed)
                }
                .padding(.horizontal,20)
                .padding(.bottom, 8)
            }
            
            .frame(maxWidth: .infinity,
                   alignment: .leading)
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 2,dash: [3]))
                .foregroundColor(AppColors.paleLavender)
            
        )
        
        .cornerRadius(8)
        .background(Color("slightPink"))
        
    }
}

// ProgressBar
struct ProgressBar: View {
    @Binding var progress: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 10)
                    .foregroundColor(Color.gray.opacity(0.2))
                
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: CGFloat(progress) * (geometry.size.width - 60) / 100, height: 10)
                    .foregroundColor(AppColors.deepIndigo)
                    .animation(.linear(duration: 2.5), value: progress)
            }
        }
        
    }
}


#Preview {
    if #available(iOS 16.0, *) {
        let job = Jobs(companyName: "Google Inc",
                       userRole: "HR Manager",
                       companyImageName: "appleIcon",
                       location: "California, USA",
                       salary: "$15K / Mo",
                       tags: ["Product Design", "UX", "UI"],
                       timeAgo: "2 days ago",
                       experienceLevel: "Senior designer",
                       jobType: "Full Time",
                       jobTitle: "Product Designer",bgcolor: AppColors.orangeColor, jobDescription: "", requirements: [
                        "Sed ut perspiciatis unde omnis iste natus error sit.",
                        "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.",
                        "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
                        "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur."
                       ],
                       facilities :[
                        "Medical",
                        "Dental",
                        "Technical Certification",
                        "Meal Allowance",
                        "Transport Allowance",
                        "Regular Hours",
                        "Mondays-Fridays"
                       ]
        )
        UploadCVView(job:job)
    } else {
        // Fallback on earlier versions
    }
}
