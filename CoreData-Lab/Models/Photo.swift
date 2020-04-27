//
//  Photo.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/24/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation

struct PhotoContainer: Decodable   {
    let hits: [Photo]
}

struct Photo: Decodable {
    let id: Int
    let tags: String
    let previewURL: String
    let webformatURL: String
    let largeImageURL: String
    let likes: Int
}
