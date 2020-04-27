//
//  PBAPIClient.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/24/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
import NetworkHelper

let searchFor = "" // + in between words
let url = "https://pixabay.com/api/?key=14991329-746c4fc942c64ffd858babd92&q=\(searchFor)&image_type=photo"

class PBAPIClient   {
    
    static func getPhotos(searchQuery: String, completion: @escaping (Result<[Photo], AppError>) -> ()) {
        let urlEndpoint = "https://pixabay.com/api/?key=14991329-746c4fc942c64ffd858babd92&q=\(searchQuery)&image_type=photo"
        
        guard let url = URL(string: urlEndpoint)
            else    {
                completion(.failure(.badURL(urlEndpoint)))
                return
        }
        
        let urlRequest = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: urlRequest) { (result) in
            switch result   {
            case .failure(let error):
                completion(.failure(.networkClientError(error)))
            case .success(let data):
                do {
                    let photoAPI = try JSONDecoder().decode(PhotoContainer.self, from: data)
                    completion(.success(photoAPI.hits))
                } catch  {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
}
