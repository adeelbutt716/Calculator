//
//  CoreDataManager.swift
//  CalculatorApp
//
//  Created by Asif on 26/04/2024.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "YourDataModelName") // Replace "YourDataModelName" with your actual data model name
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Manage data
    
    func saveHistoryList(_ items: [String]) {
        let context = persistentContainer.viewContext
        let historyListEntity = NSEntityDescription.entity(forEntityName: "HistoryList", in: context)!
        let historyListManagedObject = NSManagedObject(entity: historyListEntity, insertInto: context)
        historyListManagedObject.setValue(items, forKey: "items")
        saveContext()
    }
    
    
    func fetchHistoryList() -> [String]? {
        let context = persistentContainer.viewContext
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HistoryList")
        
        do {
            let result = try context.fetch(fetchRequest)
            if let historyListData = result.first as? NSManagedObject {
                if let items = historyListData.value(forKey: "items") as? [String] {
                    return items
                }
            }
        } catch {
            print("Failed to fetch historyList data: \(error.localizedDescription)")
        }
        return nil
    }
    
    
    func clearDatabase() {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HistoryList")
        
        do {
            let items = try context.fetch(fetchRequest)
            for item in items {
                context.delete(item as! NSManagedObject)
            }
            saveContext()
        } catch {
            print("Failed to clear database: \(error.localizedDescription)")
        }
    }
}
