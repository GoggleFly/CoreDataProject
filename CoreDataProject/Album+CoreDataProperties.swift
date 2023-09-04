//
//  Album+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by David Ash on 04/09/2023.
//
//

import Foundation
import CoreData


extension Album {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Album> {
        return NSFetchRequest<Album>(entityName: "Album")
    }

    @NSManaged public var name: String?
    @NSManaged public var singer: Singer?
    
    public var wrappedName: String {
        name ?? "Unknown Album"
    }

}

extension Album : Identifiable {

}
