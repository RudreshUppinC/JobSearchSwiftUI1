//
//  WorkExperienceSectionView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 21/05/25.
//

import SwiftUI

struct WorkExperienceSectionView: View {
    let title: String = "Work experience"
    let onAdd:() ->Void
    let onEditExperience:(WorkExperience) ->Void
    let workExperience: [WorkExperience]
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Button(action: {
                          // Handle edit action
                      }) {
                          ImageProvider.getImage(named: "workExperience").map {
                              image in
                              Image(uiImage: image)
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width:24, height:24)
                          }
                          .padding(.trailing,8)
                      }
                   
                    
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
                .padding(.top,22)
                .padding(.bottom,20)
                .padding(.horizontal,20)
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        ForEach(workExperience.prefix(1)) { experienceItem in
                            Text(experienceItem.jobTitle)
                                .font(FontStyle.dmsansBold.font(baseSize: 12))
                                .foregroundColor(AppColors.darkIndigoColor)
                                .padding(.bottom,10)
                            Text(experienceItem.companyName)
                                .font(FontStyle.dmsansRegular.font(baseSize: 10))
                                .foregroundColor(AppColors.dustyLavender)
                            Text(experienceItem.formattedDateAndDuration)
                                .font(FontStyle.dmsansRegular.font(baseSize: 10))
                                .foregroundColor(AppColors.dustyLavender.opacity(0.8))
                                .padding(.top, 4)
                        }
                    }
                    
                    
                    Spacer()
                    Button(action: {
                          // Handle edit action
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


//#Preview {
//    let sampleExperiences = [
//        WorkExperience(jobTitle: "Manager" ,
//                       companyName:"Amazon" ,
//                       startDate: UserProfile.createSampleDate(year: 2015, month: 1),
//                       endDate: UserProfile.createSampleDate(year: 2022, month: 2)),
//        
//        WorkExperience(jobTitle: "Manager1" ,
//                       companyName:"Amazon" ,
//                       startDate: UserProfile.createSampleDate(year: 2015, month: 1),
//                       endDate: UserProfile.createSampleDate(year: 2022, month: 2) )
//        
//    ]
//    WorkExperienceSectionView(viewModel: ProfileViewModal(userProfile: UserProfile.exampleLoaded),
//                              experience: sampleExperiences,
//                              onAdd: {},
//                              onEditExperience: { experience in
//        print(experience)
//    })
//}
