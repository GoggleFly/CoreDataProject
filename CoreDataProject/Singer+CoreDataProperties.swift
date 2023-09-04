//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by David Ash on 04/09/2023.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var singerCode: String?
    @NSManaged public var album: NSSet?
    
    public var wrappedFirstName: String {
        firstName ?? "Unknown"
    }
    
    public var wrappedLastName: String {
        lastName ?? "Unknown"
    }
    
    public var wrappedSingerCode: String {
        singerCode ?? "Unknown"
    }
    
    public var albumArray: [Album] {
        let set = album as? Set<Album> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for album
extension Singer {

    @objc(addAlbumObject:)
    @NSManaged public func addToAlbum(_ value: Album)

    @objc(removeAlbumObject:)
    @NSManaged public func removeFromAlbum(_ value: Album)

    @objc(addAlbum:)
    @NSManaged public func addToAlbum(_ values: NSSet)

    @objc(removeAlbum:)
    @NSManaged public func removeFromAlbum(_ values: NSSet)

}

extension Singer : Identifiable {

}
