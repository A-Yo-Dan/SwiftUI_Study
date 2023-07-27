//
//  ContentView.swift
//  Notes Watch App
//
//  Created by 정현우 on 2023/07/24.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Property
	@AppStorage("lineCount") var lineCount: Int = 1
	@State private var notes: [Note] = []
	@State private var text: String = ""
	
	
	// MARK: - Function
	func getDocumentDirectory() -> URL {
		let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		
		return path[0]
	}
	
	func save() {
		do {
			let data = try JSONEncoder().encode(notes)
			let url = getDocumentDirectory().appending(component: "notes")
			
			try data.write(to: url)
		} catch {
			print("Saving data has failed!")
		}
	}
	
	func load() {
		DispatchQueue.main.async {
			do {
				let url = getDocumentDirectory().appending(component: "notes")
				let data = try Data(contentsOf: url)
				notes = try JSONDecoder().decode([Note].self, from: data)
			} catch {
				// do nothing
			}
		}
	}
	
	func delete(offsets: IndexSet) {
		withAnimation {
			notes.remove(atOffsets: offsets)
			save()
		}
	}
	
	
	// MARK: - Body
    var body: some View {
		NavigationView {
			VStack {
				HStack(alignment: .center, spacing: 6) {
					TextField("Add New Note", text: $text)
					
					Button(action: {
						// textField가 비어있지 않을때만 버튼 액션 실행
						guard text.isEmpty == false else {return}
						
						let note = Note(id: UUID(), text: text)
						notes.append(note)
						
						// 텍스트 필드 값 비우기
						text = ""
						
						save()
					}, label: {
						Image(systemName: "plus.circle")
							.font(.system(size: 52, weight: .semibold))
					})
					.fixedSize()
					.buttonStyle(.plain)
					.foregroundColor(.accentColor)
				} //: HStack
				
				Spacer()
				
				if notes.count >= 1 {
					List {
						ForEach(0..<notes.count, id: \.self) { i in
							NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
								HStack {
									Capsule()
										.frame(width: 4)
										.foregroundColor(.accentColor)
									Text(notes[i].text)
										.lineLimit(lineCount)
										.padding(.leading, 5)
								}
							} //: HStack
						} //: Loop
						.onDelete(perform: delete)
					} //: List
				} else {
					Spacer()
					Image(systemName: "note.text")
						.resizable()
						.scaledToFit()
						.foregroundColor(.gray)
						.opacity(0.25)
						.padding(25)
					Spacer()
				}
			} //: VStack
			.navigationTitle("Notes")
			.navigationBarTitleDisplayMode(.inline)
			.onAppear {
				load()
			}

		}
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
