//
//  NewTaskItemView.swift
//  Devote
//
//  Created by 정현우 on 2023/07/12.
//

import SwiftUI

struct NewTaskItemView: View {
	
	@AppStorage("isDarkMode") private var isDarkMode: Bool = false
	@Environment(\.managedObjectContext) private var viewContext
	@State private var task: String = ""
	@FocusState var isFocused: Bool
	@Binding var isShowing: Bool
	
	private var isButtonDisabled: Bool {
		task.isEmpty
	}
	
	private func addItem() {
		withAnimation {
			let newItem = Item(context: viewContext)
			newItem.timestamp = Date()
			newItem.task = task
			newItem.completion = false
			newItem.id = UUID()

			do {
				try viewContext.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
			task = ""
			isFocused = false
			isShowing = false
		}
	}
	
    var body: some View {
		VStack {
			Spacer()
			
			VStack(spacing: 16) {
				TextField("New Task", text: $task)
					.foregroundColor(.pink)
					.font(.system(size: 24, weight: .bold, design: .rounded))
					.focused($isFocused)
					.padding()
					.background(
						isDarkMode ? Color(UIColor.tertiarySystemBackground) : Color(UIColor.secondarySystemBackground)
					)
					.cornerRadius(10)
				
				Button(action: {
					addItem()
					playSound(sound: "sound-ding", type: "mp3")
					feedback.notificationOccurred(.success)
				}, label: {
					Spacer()
					Text("Save")
						.font(.system(size: 24, weight: .bold, design: .rounded))
					
					Spacer()
				})
				.disabled(isButtonDisabled)
				.onTapGesture {
					if isButtonDisabled {
						playSound(sound: "sound-tap", type: "mp3")
					}
				}
				.padding()
				.foregroundColor(.white)
				.background(isButtonDisabled ? Color.blue : Color.pink)
				.cornerRadius(10)
			}
			.padding(.horizontal)
			.padding(.vertical, 20)
			.background(
				isDarkMode ? Color(UIColor.secondarySystemBackground) : Color.white
			)
			.cornerRadius(16)
			.shadow(color: Color.black.opacity(0.65), radius: 24)
			.frame(maxWidth: 640)
		}
		.padding()
    }
}

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
		NewTaskItemView(isShowing: .constant(true))
			.background(Color.gray)
    }
}
