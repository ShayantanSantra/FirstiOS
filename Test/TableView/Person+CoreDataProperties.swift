//
//  Person+CoreDataProperties.swift
//  Test
//
//  Created by Shayantan Santra on 16/08/21.
//  Copyright © 2021 Shayantan Santra. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var age: Int64

}
