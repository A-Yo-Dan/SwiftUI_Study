//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by 서은수 on 2023/07/22.
//

import SwiftUI

struct RipeningStagesView: View {
    
    // MARK: - Properties
    
    var ripeningStages: [Ripening] = ripeningData
    
    // MARK: - Body
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25) {
                    ForEach(ripeningStages) { stage in
                        RipeningView(ripening: stage)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
    }
}

// MARK: - Preview

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView(ripeningStages: ripeningData)
    }
}
