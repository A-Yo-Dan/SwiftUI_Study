//
//  AddTodoView.swift
//  Todo
//
//  Created by 서은수 on 2023/07/30.
//

import SwiftUI

struct AddTodoView: View {
    
    // MARK: - Properties
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name: String = ""
    @State private var priority: String = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    // THEME
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings.shared
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    // MARK: - Todo Name
                    TextField("Todo", text: $name) // 적은 값은 name에 저장됨
                        .padding()
                        .background(Color(UIColor.tertiarySystemFill))
                        .cornerRadius(9)
                        .font(.system(size: 24, weight: .bold, design: .default))
                    
                    // MARK: - Todo priority
                    Picker("Priority", selection: $priority) { // 선택한 값은 priority에 저장됨
                        ForEach(priorities, id: \.self) {
                            Text($0) // priorities 배열에 있는 거 하나씩 꺼내서 Text에 넣는다
                        } // -> Picker의 내용물을 구성하게 됨
                    }
                    .pickerStyle(.segmented)
                    
                    // MARK: - Save Button
                    
                    Button {
                        if self.name != "" {
                            // 내부 저장소에 저장할 객체 생성
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do {
                                try self.managedObjectContext.save()
                                print("New todo: \(todo.name ?? ""), Priority: \(todo.priority ?? "")")
                            } catch {
                                print(error)
                            }
                        } else {
                            self.errorShowing = true
                            self.errorTitle = "Invalid Name"
                            self.errorMessage = "Make sure to enter something for\nthe new todo item."
                            return // else일 땐 여기서 종료
                        }
                        self.presentationMode.wrappedValue.dismiss() // if문에서 걸린 후에는 sheet 닫기
                    } label: {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(themes[self.theme.themeSettings].themeColor)
                            .cornerRadius(9)
                            .foregroundColor(.white)
                    } //: Button
                } //: VStack
                .padding(.horizontal)
                .padding(.vertical, 30)
                
                Spacer()
            } //: VStack
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        } //: NavigationView
        .tint(themes[self.theme.themeSettings].themeColor)
        .navigationViewStyle(.stack)
    }
}

// MARK: - Preview

struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
