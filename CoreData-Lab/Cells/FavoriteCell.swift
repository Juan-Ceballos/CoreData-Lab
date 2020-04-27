//
//  FavoriteCell.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/26/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import NetworkHelper

class FavoriteCell: UICollectionViewCell {
      
    private lazy var favoriteImageView: UIImageView =   {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public func configureCell(favorite: Favorite) {
        favoriteImageView.setImage(with: favorite.photoURL ?? "") { (result) in
            switch result   {
            case .failure(let error):
                print("\(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self.favoriteImageView.image = image
                }
            }
        }
    }
    
    private func commonInit()   {
        setupFavoriteImageViewConstraints()
    }
    

    private func setupFavoriteImageViewConstraints()    {
        addSubview(favoriteImageView)
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoriteImageView.topAnchor.constraint(equalTo: topAnchor),
            favoriteImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoriteImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoriteImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
