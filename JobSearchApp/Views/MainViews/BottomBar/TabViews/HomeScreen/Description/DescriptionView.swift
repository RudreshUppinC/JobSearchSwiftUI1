//
//  DescriptionView.swift
//  JobSearchApp
//
//  Created by Way2 on 05/03/25.
//

import SwiftUI
import MapKit

@available(iOS 16.0, *)
struct DescriptionView: View {
    @StateObject private var viewModal = UploadCVViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack{
            ZStack{
                AppColors.offWhite.edgesIgnoringSafeArea(.all)
                VStack {
                    
                    HStack {
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }){
                            Image("BackArrow")
                        }
                        
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                    
                    ScrollView{
                        
                       
                            VStack(spacing: 16) {
                                // Header
                                HeaderView()
                                
                                SegmentView()
                                
                                // Job Description
                                JobDescriptionView()
                                
                                // Requirements
                                RequirementsView()
                                
                                // Location
                                LocationView()
                                
                                // Informations
                                InformationsView()
                                                                
                                // Facilities and Others
                                FacilitiesView()
                                
                                
                            }
                            .padding(.horizontal,20)
                        
                    }
                    .background(AppColors.offWhite)
                    .scrollIndicators(.hidden)
                    
                    ApplyButton()
                    
                }
            }
        }        .navigationBarBackButtonHidden(true)

    }
   
}

struct SegmentView: View {
    
    var body: some View {
        
        HStack(spacing: 10) { // Remove HStack's built-in spacing
            Button(action: {
                
            }) {
                Text("Description")
                    .font(FontStyle.dmsansBold.font(baseSize: 14))
                    .foregroundColor(.white )
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,10)
                    .background( Color(red: 0, green: 0, blue: 128/255) )
                    .cornerRadius(8)
            }
            .padding(.leading,10)
            
            Button(action: {
                
            }) {
                Text("Company")
                    .font(FontStyle.dmsansBold.font(baseSize: 14))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,10)
                    .foregroundColor(AppColors.deepIndigo)
                    .background(AppColors.pastelLavender)
                    .cornerRadius(8)
            }
            .padding(.trailing,10)
            
        }
        .frame(height: 40)
        
    }
}

struct HeaderView: View {
    var body: some View {
        
        VStack(spacing: 0) {
            VStack {
                Image("googlelogo1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .padding(.bottom, 40)
                    .offset(y: 40)
            }
            .frame(maxWidth: .infinity, maxHeight: 80)
            .background(AppColors.offWhite)
            .padding(.bottom, 0)
            
            
            VStack(spacing: 14) {
                Text("iOS Developer")
                    .font(FontStyle.dmsansBold.font(baseSize: 16))
                    .foregroundColor(AppColors.deepIndigo)
                    .lineLimit(1)
                
                HStack(spacing: 15) {
                    Text("Google")
                        .font(FontStyle.dmsansRegular.font(baseSize: 16))
                        .foregroundColor(AppColors.deepIndigo)
                    Image(systemName: "circle.fill")
                        .font(FontStyle.dmsansRegular.font(baseSize: 7))
                        .foregroundColor(AppColors.deepIndigo)
                    Text("California")
                        .font(FontStyle.dmsansRegular.font(baseSize: 16))
                        .foregroundColor(AppColors.deepIndigo)
                    Image(systemName: "circle.fill")
                        .font(FontStyle.dmsansRegular.font(baseSize: 7))
                        .foregroundColor(AppColors.deepIndigo)
                      
                    Text("1 day ago")
                        .font(FontStyle.dmsansRegular.font(baseSize: 16))
                        .foregroundColor(AppColors.deepIndigo)
                }
                .lineLimit(1)
            }
            
            .frame(maxWidth: .infinity)
            .background(AppColors.whisperGray)
            .padding(.vertical, 32)
        }
        .frame(maxWidth: .infinity)
        .background(AppColors.whisperGray)
        //.background(.red)

    }
    
}
// MARK: - Subviews

struct JobDescriptionView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Job Description")
                .font(FontStyle.dmsansBold.font(baseSize: 14))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,15)
            
            Text("Text ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem...")
                .font(FontStyle.dmsansBold.font(baseSize: 12))
                .foregroundColor(AppColors.dustyLavender)
                .padding(.bottom,5)
            
            Button("Read more") {
                // Handle "Read More" action
            }
            .padding(.top, 4)
            .buttonStyle(.bordered)
            .font(FontStyle.dmsansBold.font(baseSize: 12))
            .foregroundColor(AppColors.deepIndigo)
            .background(AppColors.pastelLavender)

        }
        .padding()
        
        .cornerRadius(8)
    }
}

struct RequirementsView: View {
    let requirements = [
        "Sed ut perspiciatis unde omnis iste natus error sit.",
        "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur & adipisci velit.",
        "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
        "Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur."
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Requirements")
                .font(FontStyle.dmsansBold.font(baseSize: 14))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom,16)
            
            ForEach(requirements, id: \.self) { requirement in
                HStack(alignment: .top) {
                    Text("•")
                    Text(requirement)
                        .font(FontStyle.dmsansRegular.font(baseSize: 12))
                        .foregroundColor(AppColors.dustyLavender)
                }
            }
        }
        .padding()
       
        .cornerRadius(8)
    }
}

struct LocationView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.7829, longitude: -74.1513), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Location")
                .font(FontStyle.dmsansBold.font(baseSize: 14))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom, 8)
            
            Text("Overlook Avenue, Bellville, NJ, USA.")
                .font(FontStyle.dmsansRegular.font(baseSize: 10))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom, 4)
            
            Map(coordinateRegion: $region, interactionModes: [])
                .frame(height: 200)
                .cornerRadius(8)
        }
        .padding()
        
        .cornerRadius(8)
    }
}

struct InformationsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Informations")
                .font(FontStyle.dmsansBold.font(baseSize: 14))
                .foregroundColor(AppColors.darkIndigoColor)
                .padding(.bottom, 16)
            VStack(alignment:.leading) {
                Text("Position")
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
             
                Text("Senior Designer")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.dustyLavender)
              
            }
            .padding(.bottom,15)
            
            Divider()
            
            VStack(alignment:.leading) {
                Text("Qualification")
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
       
                Text("Bachelor's Degree")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.dustyLavender)
                
            }
            .padding(.bottom,15)
            
            Divider()
            
            VStack(alignment:.leading) {
                Text("Experience")
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
           
                Text("3 Years")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.dustyLavender)
            }
            .padding(.bottom,15)
            
            Divider()
                        
            VStack(alignment:.leading) {
                Text("Job Type")
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
           
                Text("Full-Time")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.dustyLavender)
            }
            .padding(.bottom,15)
            
            Divider()
            
            VStack(alignment:.leading) {
                Text("Specialization")
                    .font(FontStyle.dmsansBold.font(baseSize: 12))
                    .foregroundColor(AppColors.darkIndigoColor)
                    .padding(.bottom,5)
           
                Text("Design")
                    .font(FontStyle.dmsansRegular.font(baseSize: 12))
                    .foregroundColor(AppColors.dustyLavender)
            }
            .padding(.bottom,15)
            
            Divider()
            
        }
        .padding()
        
        .cornerRadius(8)
    }
}





struct FacilitiesView: View {
    let facilities = [
        "Medical",
        "Dental",
        "Technical Certification",
        "Meal Allowance",
        "Transport Allowance",
        "Regular Hours",
        "Mondays-Fridays"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
                   Text("Facilities and Others")
                       .font(FontStyle.dmsansBold.font(baseSize: 12))
                       .padding(.bottom,16)

                   ForEach(facilities, id: \.self) { facility in
                       HStack(alignment: .top) {
                           Text("•")
                               .font(FontStyle.dmsansBold.font(baseSize: 12))
                               .foregroundColor(AppColors.darkIndigoColor)
                           Text(facility)
                               .font(FontStyle.dmsansRegular.font(baseSize: 12))
                               .foregroundColor(AppColors.dustyLavender)
                               .padding(.bottom,15)
                       }
                   }
               }
               .frame(maxWidth: .infinity,alignment: .leading)
    }
}


@available(iOS 16.0, *)
struct ApplyButton: View {
    @State private var isNavigateToSuccessUploadView :Bool = false
    var body: some View {
        VStack {
            HStack {
                // Circle with Image
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 50, height: 50)
                        .cornerRadius(30)
                    
                    Image("Save")
                        .frame(width: 16, height: 21)
                }
                
                NavigationLink(destination:  UploadCVView()
                               , isActive: $isNavigateToSuccessUploadView){
                    Button(action: {
                        isNavigateToSuccessUploadView = true
                    }) {
                        Text("APPLY NOW")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(AppColors.blueColor)
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 15)
                }
            }
            
            
        }
        .padding(.horizontal, 15)
        .background(AppColors.paleGray)

    }
}



#Preview {
    if #available(iOS 16.0, *) {
        DescriptionView()
    } else {
        // Fallback on earlier versions
    }
}
