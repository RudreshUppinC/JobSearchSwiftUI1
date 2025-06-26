//
//  EducationSectionView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 21/05/25.
//

import SwiftUI

struct EducationSectionView: View {
    let education:[Education]
    let onAdd:() -> Void
    let onEditEducation:(Education) -> Void

    let title: String = "Education "
    let headerHeight: CGFloat = 60
    
    let contentSpacing: CGFloat = 0
    
    @ObservedObject var vm:ProfileViewModal
    
    init(viewModel: ProfileViewModal,
         onAdd: @escaping () -> Void,
         onEditEducation: @escaping(Education) -> Void,
         education:[Education],
    ) {
          self.vm = viewModel
          self.onAdd = onAdd
          self.onEditEducation = onEditEducation
          self.education = education
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    ImageProvider.getImage(named: "education").map{
                        image in
                        Image(uiImage: image)
                            .scaledToFit()
                            .frame(width:24, height:24)
                    }
                    .padding(.trailing,8)
                    
                    Text(title)
                        .font(FontStyle.dmsansBold .font(baseSize: 12))
                        .foregroundColor(AppColors.darkIndigoColor)
                    Spacer()
                                        
                        Button(action: {
                            
                        }) {
                            ImageProvider.getImage(named: "add").map { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:24,height:24)
                            }
                        }
                }
                .padding(.horizontal)
                .padding(.top,22)
                
                VStack{
                    Divider()
                        .background(AppColors.dividerColor)
                }
                .padding(.top,20)
                .padding(.horizontal,20)
                                
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(vm.userProfile.educations) { educationItem in
                            Text(educationItem.degreeOrField)
                                .font(FontStyle.dmsansBold.font(baseSize: 12))
                                .foregroundColor(AppColors.darkIndigoColor)
                                .padding(.bottom,10)
                            Text(educationItem.institutionName)
                                .font(FontStyle.dmsansRegular.font(baseSize: 10))
                                .foregroundColor(AppColors.dustyLavender)
                            Text(educationItem.formattedDateAndDuration)
                                       .font(FontStyle.dmsansRegular.font(baseSize: 10))
                                       .foregroundColor(AppColors.dustyLavender.opacity(0.8))
                                       .padding(.top, 4)
                        }
                    }
                    
                    
                    Spacer()
                    Button(action: {
                          
                      }) {
                          ImageProvider.getImage(named: "editOrange")
                              .map { image in
                                  Image(uiImage: image)
                                      .resizable()
                                      .scaledToFit()
                                      .frame(width: 24, height: 24)
                              }
                      }

                }
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
            }

           
        }
        .background(Color.white)
        .cornerRadius(12)
    }
    
 }

#Preview {
    let sampleEducation = [
        Education(degreeOrField: "Computer Science ", institutionName: "University of Oxford",
                  startDate: UserProfile.createSampleDate(year: 2010, month: 9),
                  endDate: UserProfile.createSampleDate(year: 2013, month: 2),
                  duration:"2 years"),
        
          Education(degreeOrField: "Information Technology", institutionName: "University of Oxford",
                    startDate: UserProfile.createSampleDate(year: 2010, month: 9),
                    endDate: UserProfile.createSampleDate(year: 2013, month: 2),  
                    duration:"2 years")

       ]
    
    EducationSectionView(viewModel: ProfileViewModal(userProfile: UserProfile.exampleLoaded), onAdd: {
        
    }, onEditEducation: { education in }, education: sampleEducation)
}
