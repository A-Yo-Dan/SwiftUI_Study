//
//  Persistence.swift
//  DEVOTE
//
//  Created by 박민서 on 2023/08/02.
//

import CoreData

struct PersistenceController {
    // MARK: - PERSISTENT CONTROLLER - with coordinator including model, context
    static let shared = PersistenceController()
    
    // MARK: - PERSISNTENT CONTAINER - storage property
    let container: NSPersistentContainer
    
    // MARK: - initialization ( load persistent store )
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DEVOTE")
        if inMemory { // in-memory -> which is on memory, temporarily
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        // load persistent store
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: - PREVIEW for SWIFTUI Preview
    static var preview: PersistenceController = {
      let result = PersistenceController(inMemory: true)
      let viewContext = result.container.viewContext
      for i in 0..<5 {
        let newItem = Item(context: viewContext)
        newItem.timestamp = Date()
        newItem.task = "Sample task No\(i)"
        newItem.completion = false
        newItem.id = UUID()
      }
      do {
        try viewContext.save()
      } catch {
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
      return result
    }()
}
