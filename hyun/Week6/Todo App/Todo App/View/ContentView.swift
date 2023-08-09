//
//  ContentView.swift
//  Todo App
//
//  Created by 정현우 on 2023/08/03.
//

import SwiftUI
import CoreData

struct ContentView: View {
	@Environment(\.managedObjectContext) var managedObjectContext
	@FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
	@EnvironmentObject var iconSettings: IconNames
	
	@State private var showingSettingsView: Bool = false
	@State private var showingAddTodoView: Bool = false
	@State private var animatingButton: Bool = false
	
	@ObservedObject var theme = ThemeSettings()
	var themes: [Theme] = themeData

	
	
	var body: some View {
		NavigationView {
			ZStack {
				List {
					ForEach(self.todos, id: \.self) { todo in
						HStack {
							Circle()
								.frame(width: 12, height: 12, alignment: .center)
								.foregroundColor(self.colorize(priority: todo.priority ?? "Normal"))
							Text(todo.name ?? "Unknown")
								.fontWeight(.semibold)
							Spacer()
							Text(todo.priority ?? "Unknown")
								.font(.footnote)
								.foregroundColor(Color(UIColor.systemGray2))
								.padding(3)
								.frame(minWidth: 62)
								.overlay(
									Capsule()
										.stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
								)
						}
						.padding(.vertical, 10)
					}
					.onDelete(perform: deleteTodo)
				}
				.navigationTitle("New Todo")
				.navigationBarTitleDisplayMode(.inline)
				.toolbar(content: {
					ToolbarItem(placement: .navigationBarLeading, content: {
						EditButton()
							.tint(themes[self.theme.themeSettings].themeColor)
					})
					ToolbarItem(placement: .navigationBarTrailing, content: {
						Button(action: {
							self.showingSettingsView.toggle()
						}, label: {
							Image(systemName: "paintbrush")
								.imageScale(.large)
								.tint(themes[self.theme.themeSettings].themeColor)
						})
						.sheet(isPresented: $showingSettingsView, content: {
							SettingsView()
								.environmentObject(self.iconSettings)
						})
					})
					
					
				})
				
				if todos.count == 0 {
					EmptyListView()
				}
			} //: ZStack
			.sheet(isPresented: $showingAddTodoView, content: {
				AddTodoView()
					.environment(\.managedObjectContext, self.managedObjectContext)
			})
			.overlay(alignment: .bottomTrailing, content: {
				ZStack {
					Group {
						Circle()
							.fill(themes[self.theme.themeSettings].themeColor)
							.opacity(animatingButton ? 0.2 : 0)
							.scaleEffect(animatingButton ? 1 : 0)
							.frame(width: 68, height: 68, alignment: .center)
						Circle()
							.fill(themes[self.theme.themeSettings].themeColor)
							.opacity(animatingButton ? 0.15 : 0)
							.scaleEffect(animatingButton ? 1 : 0)
							.frame(width: 88, height: 88, alignment: .center)
					}
					.animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animatingButton)
					
					Button(action: {
						self.showingAddTodoView.toggle()
					}, label: {
						Image(systemName: "plus.circle.fill")
							.resizable()
							.scaledToFit()
							.background(Circle().fill(Color("ColorBase")))
							.frame(width: 48, height: 48, alignment: .center)
					})
					.tint(themes[self.theme.themeSettings].themeColor)
					.onAppear() {
						self.animatingButton.toggle()
					}
				} //: ZStack
				.padding(.bottom, 15)
				.padding(.trailing, 15)
			}) //: overlay
		} //: Navigation
		.navigationViewStyle(.stack)
	}
	
	private func deleteTodo(at offsets: IndexSet) {
		for index in offsets {
			let todo = todos[index]
			managedObjectContext.delete(todo)
			
			do {
				try managedObjectContext.save()
			} catch {
				print(error)
			}
		}
	}
	
	private func colorize(priority: String) -> Color {
		switch priority {
		case "High":
			return .pink
		case "Normal":
			return .green
		case "Low":
			return .blue
		default:
			return .gray
		}
	}
	
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
