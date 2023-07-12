//
//  ListRowItemView.swift
//  Devote
//
//  Created by 정현우 on 2023/07/12.
//

import SwiftUI

struct ListRowItemView: View {
	@Environment(\.managedObjectContext) private var viewContext
	@ObservedObject var item: Item
	
    var body: some View {
		Toggle(isOn: $item.completion, label: {
			Text(item.task ?? "")
				.font(.system(.title2, design: .rounded))
				.fontWeight(.heavy)
				.foregroundColor(item.completion ? Color.pink : Color.primary)
				.padding(.vertical, 12)
				.animation(.default)
		})
		.toggleStyle(CheckboxStyle())
		
		.onReceive(item.objectWillChange, perform: { _ in
			if self.viewContext.hasChanges {
				try? self.viewContext.save()
			}
		})
    }
}
