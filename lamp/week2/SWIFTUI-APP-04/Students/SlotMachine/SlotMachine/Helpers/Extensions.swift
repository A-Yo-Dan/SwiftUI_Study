//
//  Extensions.swift
//  SlotMachine
//
//  Created by 박민서 on 2023/07/12.
//

import SwiftUI

extension Text {
    func scoreLabelStyle() -> Text {
        self
        .foregroundColor(Color.white)
        .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func scoreNumberStyle() -> Text {
        self
            .foregroundColor(Color.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
}
