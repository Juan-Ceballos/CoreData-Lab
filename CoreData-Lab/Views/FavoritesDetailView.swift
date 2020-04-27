//
//  FavoritesDetailView.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/26/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class DetailFavoritesView: UIView {
    
    public lazy var favoriteDetailImageView: UIImageView =  {
        let imageView = UIImageView()
        return imageView
    }()
        
    public lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.text = "fefewf"
        return label
    }()
    
    public lazy var tagsLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var previewURLLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var webformatURLLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var detailFavoriteStackView: UIStackView =  {
        let stackView = UIStackView()
        stackView.backgroundColor = .red
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.addArrangedSubview(likesLabel)
        stackView.addArrangedSubview(tagsLabel)
        stackView.addArrangedSubview(previewURLLabel)
        stackView.addArrangedSubview(webformatURLLabel)
        return stackView
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
        setupFavoritesDetailImageView()
        setupDetailFavoriteStackView()
    }
    
    private func setupFavoritesDetailImageView()    {
        addSubview(favoriteDetailImageView)
        
        favoriteDetailImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            favoriteDetailImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            favoriteDetailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            favoriteDetailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoriteDetailImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)
        
        ])
    }
    
    private func setupDetailFavoriteStackView() {
        addSubview(detailFavoriteStackView)
        
        detailFavoriteStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            detailFavoriteStackView.topAnchor.constraint(equalTo: favoriteDetailImageView.bottomAnchor, constant: 11),
            detailFavoriteStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailFavoriteStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailFavoriteStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)
        
        ])
    }
    
}
