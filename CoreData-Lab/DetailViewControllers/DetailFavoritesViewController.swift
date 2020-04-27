//
//  DetailFavoritesViewController.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailFavoritesViewController: UIViewController {

    let detailFavoriteView = DetailFavoritesView()
    
    override func loadView() {
        view = detailFavoriteView
    }
    
    var favorite: Favorite?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
    }
    
    private func configureUI()  {
        guard let currentFavorite = favorite
            else    {
                return
        }
        
        detailFavoriteView.favoriteDetailImageView.setImage(with: currentFavorite.photoURL ?? "") { (result) in
            switch result   {
            case .failure(let error):
                print("\(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.detailFavoriteView.favoriteDetailImageView.image = image
                }
            }
        }
        
        detailFavoriteView.likesLabel.text = currentFavorite.likes
        detailFavoriteView.previewURLLabel.text = currentFavorite.previewURL
        detailFavoriteView.tagsLabel.text = currentFavorite.tags
        print("\(currentFavorite.tags ?? "fgf")")
        detailFavoriteView.webformatURLLabel.text = currentFavorite.webformatURL
    }
    
}
