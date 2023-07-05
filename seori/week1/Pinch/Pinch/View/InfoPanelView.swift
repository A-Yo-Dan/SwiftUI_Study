//
//  InfoPanelView.swift
//  Pinch
//
//  Created by 서은수 on 2023/07/05.
//

import SwiftUI

struct InfoPanelView: View {
    var scale:CGFloat
    var offset: CGSize
    
    @State private var isInfoPanelVisible = false
    
    var body: some View {
        HStack {
            
            // MARK: - HOTSPOT
            
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30, height: 30)
            // 길게 누르는 제스쳐
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        // T -> F / F -> T
                        isInfoPanelVisible.toggle()
                    }
                }
            Spacer()
            
            // MARK: - INFO PANEL
            
            // 아이콘과 텍스트가 들어간 수평 방향의 스택뷰
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                Text("\(scale)")
                
                Spacer()
                
                Image(systemName: "arrow.left.and.right")
                Text("\(offset.width)")
                
                Spacer()
                
                Image(systemName: "arrow.up.and.down")
                Text("\(offset.height)")
                
                Spacer()
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            
            Spacer()
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offset: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
