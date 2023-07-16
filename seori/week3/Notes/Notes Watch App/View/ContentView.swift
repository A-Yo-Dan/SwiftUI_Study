//
//  ContentView.swift
//  Notes Watch App
//
//  Created by 서은수 on 2023/07/14.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    
    @AppStorage("lineCount") var lineCount: Int = 1 // 로컬에서 불러옴
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    // MARK: - Function
    
    // 데이터를 저장한 url path를 알려줌
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    // 애플워치 로컬에 저장
    func save() {
        //        dump(notes)
        do {
            // 1. Convert the notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            
            // 2. Create a new URL to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3. Write the data to the given URL
            try data.write(to: url)
        } catch {
            print("Saving data has failed!")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1. Get the notes from URL path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                
                // 3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // Do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        } // 노트를 지운 뒤 저장
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add new note", text: $text)
                    Button {
                        // Action
                        // 1. Only run the button's action when the text field is not empty
                        // 텍스트가 비어있으면 return으로 여기서 종료됨
                        guard text.isEmpty == false else { return }
                        
                        // 2. Create a new note item and initialize it with the text value
                        let note = Note(id: UUID(), text: text)
                        
                        // 3. Add the new note item to the notes array (append)
                        notes.append(note)
                        
                        // 4. Make the text field empty
                        text = ""
                        
                        // 5. Save the notes (function)
                        save() // 버튼 클릭할 때마다 현재 notes 상태가 저장이 됨
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 42, weight: .semibold))
                    }
                    .fixedSize()
                    //                .buttonStyle(.bordered)
                    .buttonStyle(.plain)
                    .foregroundColor(.accentColor)
                } //: Hstack
                
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
                            }
                        } //: Loop
                        .onDelete(perform: delete)
                    }
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
            } //: Vstack
            .navigationTitle("Notes")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                // 로컬에서 불러오기
                load()
            }
        } //: NavigationView
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
