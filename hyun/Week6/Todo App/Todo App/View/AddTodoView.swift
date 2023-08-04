//
//  AddTodoView.swift
//  Todo App
//
//  Created by 정현우 on 2023/08/03.
//

import SwiftUI

struct AddTodoView: View {
	@Environment(\.managedObjectContext) var managedObjectContext
	@Environment(\.dismiss) var dismiss
	@State private var name: String = ""
	@State private var priority: String = "Normal"
	
	let priorities = ["High", "Normal", "Low"]
	
	@State private var errorShowing: Bool = false
	@State private var errorTitle: String = ""
	@State private var errorMessage: String = ""
	
	@ObservedObject var theme = ThemeSettings()
	var themes: [Theme] = themeData
	
	var body: some View {
		NavigationView {
			VStack {
				VStack(alignment: .leading, spacing: 20) {
					Form {
						TextField("Todo", text: $name)
							.padding()
							.background(Color(UIColor.tertiarySystemFill))
							.cornerRadius(9)
							.font(.system(size: 24, weight: .bold, design: .default))
						
						Picker("Priority", selection: $priority) {
							ForEach(priorities, id: \.self) {
								Text($0)
							}
						}
						.pickerStyle(.segmented)
						
						Button(action: {
							if self.name != "" {
								let todo = Todo(context: self.managedObjectContext)
								todo.name = self.name
								todo.priority = self.priority
								
								do {
									try self.managedObjectContext.save()
									
								} catch {
									print(error)
								}
							} else {
								self.errorShowing = true
								self.errorTitle = "Invalid Name"
								self.errorMessage = "Make sure to enter something for\nthe new todo item."
								return
							}
							self.dismiss()
							
						}, label: {
							Text("Save")
								.font(.system(size: 24, weight: .bold, design: .default))
								.padding()
								.frame(minWidth: 0, maxWidth: .infinity)
								.background(themes[self.theme.themeSettings].themeColor)
								.cornerRadius(9)
								.foregroundColor(.white)
						})
					} //: Form
					
					
					
					Spacer()
				} //: VStack
				.navigationTitle("New Todo")
				.navigationBarTitleDisplayMode(.inline)
				.toolbar(content: {
					Button(action: {
						self.dismiss()
					}, label: {
						Image(systemName: "xmark")
					})
				})
				.alert(self.errorTitle, isPresented: $errorShowing, actions: {
					
				}, message: {
					Text(errorMessage)
				})
			}  //: VStack
		}  //: NavigationView
		.tint(themes[self.theme.themeSettings].themeColor)
		.navigationViewStyle(.stack)
	}
}

struct AddTodoView_Previews: PreviewProvider {
	static var previews: some View {
		AddTodoView()
	}
}
