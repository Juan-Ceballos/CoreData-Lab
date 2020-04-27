//
//  Favorite+CoreDataProperties.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/26/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//
//

import Foundation
import CoreData


extension Favorite {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Favorite> {
        return NSFetchRequest<Favorite>(entityName: "Favorite")
    }

    @NSManaged public var photoURL: String?
    @NSManaged public var id: String?
    @NSManaged public var favoritedDate: Date?
    @NSManaged public var likes: String?
    @NSManaged public var tags: String?
    @NSManaged public var previewURL: String?
    @NSManaged public var webformatURL: String?

}
