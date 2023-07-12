//
//  Constant.swift
//  Devote
//
//  Created by 정현우 on 2023/07/11.
//

import SwiftUI

let itemFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateStyle = .short
	formatter.timeStyle = .medium
	return formatter
}()

var backgroundGradient: LinearGradient {
	return LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
}

var feedback = UINotificationFeedbackGenerator()
