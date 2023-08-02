//
//  ContentView.swift
//  Todo
//
//  Created by 서은수 on 2023/07/30.
//

import SwiftUI
import CoreData

struct ContentView: View {
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) var managedObjectContext // 내부 저장소에 접근할 수 있게 됨
    
    // Todo 엔티티를 이름 ascending 순으로 정렬해서 가져온다.
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    
    @EnvironmentObject var iconSettings: IconNames
    
    @State private var showingSettingsView: Bool = false
    @State private var showingAddTodoView: Bool = false
    @State private var animatingButton: Bool = false
    
    // THEME
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach (self.todos, id: \.self) { todo in
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
                                    Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                                )
                        } //: HStack
                        .padding(.vertical, 10)
                    } //: ForEach
                    .onDelete(perform: deleteTodo) // 리스트의 아이템을 왼쪽으로 스와이프 하면 빨간색 delete 버튼이 생겨남 -> 해당 버튼 클릭 시 deleteTodo 함수 실행
                } //: List
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: EditButton().tint(themes[self.theme.themeSettings].themeColor),
                    trailing:
                        Button(action: {
                            self.showingSettingsView.toggle()
                        }, label: {
                            Image(systemName: "paintbrush")
                                .imageScale(.large)
                        }) //: SettingsView
                        .tint(themes[self.theme.themeSettings].themeColor)
                        .sheet(isPresented: $showingSettingsView, content: {
                            SettingsView().environmentObject(self.iconSettings)
                            // contentview is ready to communicate with the settingsview
                        })
                )
                
                // MARK: - No Todo Items
                
                if todos.count == 0 {
                    EmptyListView()
                }
            } //: ZStack
            .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView().environment(\.managedObjectContext, self.managedObjectContext) // AddTodoView와 연결 완
            })
            .overlay(
                ZStack {
                    Group {
                        Circle()
                            .fill(themes[self.theme.themeSettings].themeColor)
                            .opacity(self.animatingButton ? 0.2 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 68, height: 68, alignment: .center)
                        Circle()
                            .fill(themes[self.theme.themeSettings].themeColor)
                            .opacity(self.animatingButton ? 0.15 : 0)
                            .scaleEffect(self.animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88, alignment: .center)
                    }
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: self.animatingButton)
                    
                    Button {
                        self.showingAddTodoView.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(Circle().fill(Color("ColorBase")))
                            .frame(width: 48, height: 48, alignment: .center)
                    }
                    .tint(themes[self.theme.themeSettings].themeColor)
                    .onAppear {
                        self.animatingButton.toggle()
                    }
                } //: ZStack
                    .padding(.bottom, 15)
                    .padding(.trailing, 15)
                , alignment: .bottomTrailing
            )
        } //: NavigationView
        .navigationViewStyle(.stack)
    }
    
    // MARK: - Functions
    
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
 
// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        ContentView()
            .environment(\.managedObjectContext, context)
    }
}
