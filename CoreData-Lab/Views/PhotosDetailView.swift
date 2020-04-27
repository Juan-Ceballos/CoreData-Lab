//
//  PhotosDetailView.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/26/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailPhotosView: UIView {
    
    public lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    public lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        return button
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
        setupPhotoImageViewConstraints()
        setupFavoriteButtonConstraints()
    }
    
    private func setupPhotoImageViewConstraints()   {
        addSubview(photoImageView)
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)
        ])
    }
    
    private func setupFavoriteButtonConstraints()   {
        addSubview(favoriteButton)
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            favoriteButton.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 44),
            favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
    
}
