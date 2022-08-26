//
//  MyNote+CoreDataProperties.swift
//  MirianMaglakelidze#26
//
//  Created by Admin on 8/26/22.
//
//

import Foundation
import CoreData


extension MyNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyNote> {
        return NSFetchRequest<MyNote>(entityName: "MyNote")
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var info: String?
    @NSManaged public var isFavourite: Bool
    @NSManaged public var title: String?

}

extension MyNote : Identifiable {

}
