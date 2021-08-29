//
//  PhoneBook+CoreDataProperties.swift
//  coreDataPractice
//
//  Created by Junhong Park on 2021/08/27.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var detail: NSObject?
    @NSManaged public var name: NSObject?
    @NSManaged public var number: NSObject?

}

extension PhoneBook : Identifiable {

}
