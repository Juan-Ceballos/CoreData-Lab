//
//  CoreDataManager.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/25/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager   {
    static let shared = CoreDataManager()
    private init()  {}
    
    private var favorites = [Favorite]()
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    public func createFavorite(id: String, tags: String, previewURL: String, webformatURL: String, photoURL: String, date: Date, likes: String) -> Favorite    {
        let favorite = Favorite(entity: Favorite.entity(), insertInto: context)
        favorite.favoritedDate = date
        favorite.id = id
        favorite.photoURL = photoURL
        favorite.likes = likes
        favorite.tags = tags
        favorite.previewURL = previewURL
        favorite.webformatURL = webformatURL
        
        do {
            try context.save()
        } catch  {
            print("\(error)")
        }
        return favorite
    }
    
    public func fetchFavorites() -> [Favorite]  {
        do {
            favorites = try context.fetch(Favorite.fetchRequest())
        } catch  {
            print("\(error)")
        }
        
        return favorites
    }
}
