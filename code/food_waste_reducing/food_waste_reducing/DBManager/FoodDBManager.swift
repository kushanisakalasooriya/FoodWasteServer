//
//  FoodDBManager.swift
//  food_waste_reducing
//
//  Created by Kushani Sakalasooriya on 2023-04-18.
//

import UIKit
import CoreData

class FoodDBManager {
    static let share = FoodDBManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "food_waste_reducing")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchFood() -> [Food] {
        
        var food = [Food]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Food.description())
        
        do {
            food = try context.fetch(fetchRequest) as! [Food]
        }catch {
            print("feching error")
        }
        
        return food
    }
    
}
