//
//  SkillsSectionView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 21/05/25.
//

import SwiftUI

struct SkillsSectionView: View {
    @ObservedObject var vm: ProfileViewModal
    let onEdit: () -> Void

    @State private var isExpanded: Bool = false
    let initialDisplayLimit = 5

    private var skillsToDisplay: [Skill] {
        if isExpanded {
            return vm.userProfile.skills
        } else {
            return Array(vm.userProfile.skills.prefix(initialDisplayLimit))
        }
    }

    private var remainingSkillsCount: Int {
        max(0, vm.userProfile.skills.count - initialDisplayLimit)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // MARK: - Header
            HStack {
                
                ImageProvider.getImage(named: "skill").map{
                    image in
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width:24, height:24)
                }
                  .padding(.trailing,8)
                
                                
                    Text("Skill")
                        .font(FontStyle.dmsansBold .font(baseSize: 12))
                        .foregroundColor(AppColors.darkIndigoColor)
                    
                Spacer()
                Button(action: onEdit) {
                    ImageProvider.getImage(named: "editOrange").map{
                        image in
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(width:24, height:24)
                    }
                }
            }
            .padding(.horizontal)

            Divider().padding(.horizontal)

            // MARK: - Skills Flow Layout
            if #available(iOS 16.0, macOS 13.0, *) {
                FlowLayout(spacing: 10) {
                    ForEach(skillsToDisplay) { skill in
                        SkillTagView(skillName: skill.name)
                    }
                    
                    if !isExpanded && remainingSkillsCount > 0 {
                        Text("+\(remainingSkillsCount) more")
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal)
            } else {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100), spacing: 10)], spacing: 10) {
                    ForEach(skillsToDisplay) { skill in
                        SkillTagView(skillName: skill.name)
                    }
                    if !isExpanded && remainingSkillsCount > 0 {
                        Text("+\(remainingSkillsCount) more")
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .foregroundColor(AppColors.skyLavender)
                    }
                }
                .padding(.horizontal)
            }


            // MARK: - See More Button
            if !vm.userProfile.skills.isEmpty && remainingSkillsCount > 0 {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Text(isExpanded ? "See less" : "See more")
                            .font(FontStyle.dmsansRegular.font(baseSize: 10))
                            .foregroundColor(AppColors.brightVioletColor)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
        }
        .padding(.vertical)
        .background(Color.white)
         .cornerRadius(12)
    }
}

struct SkillsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        let mockVM = ProfileViewModal(userProfile: UserProfile.exampleLoaded)
        
        let fewSkillsVM = ProfileViewModal(userProfile: UserProfile.exampleLoaded)

        let noSkillsVM = ProfileViewModal(userProfile: UserProfile.exampleLoaded)
        noSkillsVM.userProfile.skills = []


        return Group {
           

            SkillsSectionView(vm: mockVM, onEdit: {})
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Default (iOS 16+)")

            SkillsSectionView(vm: fewSkillsVM, onEdit: {})
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Few Skills")

            SkillsSectionView(vm: noSkillsVM, onEdit: {})
                .padding()
                .previewLayout(.sizeThatFits)
                .previewDisplayName("No Skills")
        }
    }
}


