//
//  Food+CoreDataProperties.swift
//  food_waste_reducing
//
//  Created by Kushani Sakalasooriya on 2023-04-18.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var foodTitle: String?
    @NSManaged public var foodDescription: String?
    @NSManaged public var foodCategory: String?

}

extension Food : Identifiable {

}
