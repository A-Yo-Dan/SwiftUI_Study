//
//  ContentView.swift
//  Devote
//
//  Created by 정현우 on 2023/07/11.
//

import SwiftUI
import CoreData

struct ContentView: View {
	// MARK: - Property
	@AppStorage("isDarkMode") private var isDarkMode: Bool = false
	@State var task: String = ""
	@State private var showNewTaskItem: Bool = false
	
	// MARK: - Fetching Data
	@Environment(\.managedObjectContext) private var viewContext
	
	@FetchRequest(
		sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
		animation: .default)
	private var items: FetchedResults<Item>
	
	// MARK: - Body
	var body: some View {
		NavigationView {
			ZStack {
				// MARK: - Main View
				VStack {
					// MARK: - Header
					HStack(spacing: 10) {
						Text("Devote")
							.font(.system(.largeTitle, design: .rounded))
							.fontWeight(.heavy)
							.padding(.leading, 4)
						
						Spacer()
						
						EditButton()
							.font(.system(size: 16, weight: .semibold, design: .rounded))
							.padding(.horizontal, 10)
							.frame(minWidth: 70, minHeight: 24)
							.background(
								Capsule().stroke(Color.white, lineWidth: 2)
							)
						
						
						Button(action: {
							isDarkMode.toggle()
							playSound(sound: "sound-tap", type: "mp3")
							feedback.notificationOccurred(.success)
						}, label: {
							Image(systemName: isDarkMode ? "moon.circle.fill" : "moon.circle")
								.resizable()
								.frame(width: 24, height: 24)
								.font(.system(.title, design: .rounded))
						})
					} //: HStack
					.padding()
					.foregroundColor(.white)
					
					Spacer(minLength: 80)
					
					// MARK: - New Task Button
					Button(action: {
						showNewTaskItem = true
						playSound(sound: "sound-ding", type: "mp3")
						feedback.notificationOccurred(.success)
					}, label: {
						Image(systemName: "plus.circle")
							.font(.system(size: 30, weight: .semibold, design: .rounded))
						Text("New Task")
							.font(.system(size: 24, weight: .bold, design: .rounded))
					})
					.foregroundColor(.white)
					.padding(.horizontal, 20)
					.padding(.vertical, 15)
					.background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .leading, endPoint: .trailing))
					.clipShape(Capsule())
					.shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 4)
					
					// MARK: - Tasks
					if #available(iOS 16.0, *) {
						List {
							ForEach(items) { item in
								ListRowItemView(item: item)
							}
							.onDelete(perform: deleteItems)
						} //: List
						.scrollContentBackground(.hidden)
						.background(Color.clear)
						.listStyle(.insetGrouped)
					} else {
						List {
							ForEach(items) { item in
								ListRowItemView(item: item)
							}
							.onDelete(perform: deleteItems)
						} //: List
						.onAppear() {
							UITableView.appearance().backgroundColor = UIColor.clear
						}
						.listStyle(.insetGrouped)
						.shadow(color: Color.black.opacity(0.3), radius: 12)
						.padding(.vertical, 0)
						.frame(maxWidth: 640)
					}
				} //: VStack
				.blur(radius: showNewTaskItem ? 8 : 0, opaque: false)
				.transition(.move(edge: .bottom))
				.animation(.easeOut(duration: 0.5))
				
				// MARK: - New Task Item
				if showNewTaskItem {
					BlankView(
						backgroundColor: isDarkMode ? .black : .gray,
						backgroundOpacity: isDarkMode ? 0.3 : 0.5)
						.onTapGesture {
							withAnimation() {
								showNewTaskItem = false
							}
						}
					
					NewTaskItemView(isShowing: $showNewTaskItem)
				}
				
			} //: ZStack
			.navigationTitle("Daily Tasks")
			.navigationBarTitleDisplayMode(.large)
			.navigationBarHidden(true)
			.background(
				BackgroundImageView()
					.blur(radius: showNewTaskItem ? 8 : 0, opaque: false)
			)
			.background(
				backgroundGradient
			)
		} //: Navigation
		.navigationViewStyle(.stack)
	}
	
	
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			offsets.map { items[$0] }.forEach(viewContext.delete)
			
			do {
				try viewContext.save()
			} catch {
				// Replace this implementation with code to handle the error appropriately.
				// fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
				let nsError = error as NSError
				fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
	}
}
