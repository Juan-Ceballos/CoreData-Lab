//
//  UIImage+Extensions.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/26/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import NetworkHelper

extension UIImageView   {
    func setImage(with urlString: String, completion: @escaping(Result<UIImage, AppError>) -> ())    {
        
        guard let url = URL(string: urlString)
            else    {
                completion(.failure(.badURL(urlString)))
                return
        }
        
        let urlRequest = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: urlRequest) { (result) in
            switch result   {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                if let image = UIImage(data: data)  {
                    completion(.success(image))
                }
            }
        }
    }
}
