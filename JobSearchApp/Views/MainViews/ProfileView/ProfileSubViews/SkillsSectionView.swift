//
//  SkillsSectionView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 21/05/25.
//

import SwiftUI

struct SkillsSectionView: View {
    let onEdit: () -> Void
    let skills:[Skill]
    @State private var isExpanded: Bool = false
    let initialDisplayLimit = 5
    
    private var skillsToDisplay: [Skill] {
        if isExpanded {
            return skills
        } else {
            return Array(skills.prefix(initialDisplayLimit))
        }
    }
    
    private var remainingSkillsCount: Int {
        max(0, skills.count - initialDisplayLimit)
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
            .padding(.vertical,15)
            
            VStack{
                Divider()
                    .background(AppColors.dividerColor)
            }
            .padding(.horizontal,20)
            
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
            if !skills.isEmpty && remainingSkillsCount > 0 {
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
                .padding(.bottom,10)
                
            }
        }
        .background(Color.white)
        .cornerRadius(12)
        
    }
}



