//
//  FavoritesView.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    public lazy var favoritesCollectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit()   {
        setupFavoritesCollectionViewConstraints()
    }
        
    private func setupFavoritesCollectionViewConstraints()   {
        addSubview(favoritesCollectionView)
        
        favoritesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            favoritesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            favoritesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoritesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoritesCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        
        ])
    }
    
}
