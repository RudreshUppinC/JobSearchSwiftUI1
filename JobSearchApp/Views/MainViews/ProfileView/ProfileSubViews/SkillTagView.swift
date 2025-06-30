//
//  SkillTagView.swift
//  JobSearchApp
//
//  Created by RudreshUppin on 21/05/25.
//

import SwiftUI


struct SkillTagView: View {
    let skillName: String
    
    var body: some View {
        Text(skillName)
            .font(FontStyle.dmsansRegular.font(baseSize: 12))
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(AppColors.mutatedLavender)
            .clipShape(Capsule())
            .foregroundColor(AppColors.dustyLavender)
    }
}
@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
struct FlowLayout: Layout {
    var spacing: CGFloat
    
    init(spacing: CGFloat = 8) {
        self.spacing = spacing
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        guard !subviews.isEmpty else { return .zero }
        
        let containerWidth = proposal.width ?? 0
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var rowHeight: CGFloat = 0
        var totalHeight: CGFloat = 0
        
        for subview in subviews {
            let subviewSize = subview.sizeThatFits(.unspecified)
            
            if currentX + subviewSize.width > containerWidth && currentX > 0 {
                currentY += rowHeight + spacing
                totalHeight = currentY
                currentX = 0
                rowHeight = 0
            }
            
            currentX += subviewSize.width + spacing
            rowHeight = max(rowHeight, subviewSize.height)
        }
        totalHeight += rowHeight
        
        return CGSize(width: containerWidth, height: totalHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        var currentX = bounds.minX
        var currentY = bounds.minY
        var rowHeight: CGFloat = 0
        
        for subview in subviews {
            let subviewSize = subview.sizeThatFits(.unspecified)
            
            if currentX + subviewSize.width > bounds.maxX && currentX > bounds.minX { 
                currentY += rowHeight + spacing
                currentX = bounds.minX
                rowHeight = 0
            }
            
            let placementProposal = ProposedViewSize(width: subviewSize.width, height: subviewSize.height)
            subview.place(at: CGPoint(x: currentX, y: currentY), anchor: .topLeading, proposal: placementProposal)
            
            currentX += subviewSize.width + spacing
            rowHeight = max(rowHeight, subviewSize.height)
        }
    }
}

