//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Dathan Wong on 6/24/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String{
        name ?? "Unknown Candy"
    }
}
