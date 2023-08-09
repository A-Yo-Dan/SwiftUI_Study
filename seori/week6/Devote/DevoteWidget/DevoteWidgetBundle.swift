//
//  DevoteWidgetBundle.swift
//  DevoteWidget
//
//  Created by 서은수 on 2023/08/09.
//

import WidgetKit
import SwiftUI

@main
struct DevoteWidgetBundle: WidgetBundle {
    var body: some Widget {
        DevoteWidget()
        DevoteWidgetLiveActivity()
    }
}
