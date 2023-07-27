//
//  DetailView.swift
//  Notes Watch App
//
//  Created by 정현우 on 2023/07/24.
//

import SwiftUI

struct DetailView: View {
	// MARK: - Property
	let note: Note
	let count: Int
	let index: Int
	
	@State private var isCreditsPresented: Bool = false
	@State private var isSettingsPresented: Bool = false
	
	// MARK: - Body
    var body: some View {
		VStack(alignment: .center, spacing: 3) {
			// Header
			HeaderView()
			
			// Content
			Spacer()
			
			ScrollView(.vertical) {
				Text(note.text)
					.font(.title3)
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
			}
			
			Spacer()
			
			// Footer
			HStack(alignment: .center) {
				Image(systemName: "gear")
					.imageScale(.large)
					.onTapGesture {
						isSettingsPresented.toggle()
					}
					.sheet(isPresented: $isSettingsPresented, content: {
						SettingsView()
					})
				
				Spacer()
				
				Text("\(count) / \(index + 1)")
				
				Spacer()
				
				Image(systemName: "info.circle")
					.imageScale(.large)
					.onTapGesture {
						isCreditsPresented.toggle()
					}
					.sheet(isPresented: $isCreditsPresented, content: {
						CreditsView()
					})
			} //: HStack
			.foregroundColor(.secondary)
			
		} //: VStack
		.padding(3)
    }
}
// MARK: - Preview
struct DetailView_Previews: PreviewProvider {
	static var sampleData: Note = Note(id: UUID(), text: "Hello world")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
