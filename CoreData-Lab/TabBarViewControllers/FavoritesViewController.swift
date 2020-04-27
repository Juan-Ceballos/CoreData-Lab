//
//  FavoritesViewController.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    let favoritesView = FavoritesView()
    
    override func loadView() {
        view = favoritesView
    }
    
    var favorites = [Favorite]()    {
        didSet  {
            DispatchQueue.main.async {
                self.favoritesView.favoritesCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        navigationItem.title = "Favorites"
        favoritesView.favoritesCollectionView.register(FavoriteCell.self, forCellWithReuseIdentifier: "favoriteCell")
        favoritesView.favoritesCollectionView.dataSource = self
        favoritesView.favoritesCollectionView.delegate = self
        fetchFavoritePhotos()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fetchFavoritePhotos()
    }
    
    private func fetchFavoritePhotos()  {
        favorites = CoreDataManager.shared.fetchFavorites()
    }

}

extension FavoritesViewController: UICollectionViewDataSource    {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favoriteCell", for: indexPath) as? FavoriteCell
            else    {
                fatalError()
        }
        let favorite = favorites[indexPath.row]
        cell.configureCell(favorite: favorite)
        return cell
    }
    
}

extension FavoritesViewController: UICollectionViewDelegateFlowLayout    {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.40
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailFavoritesViewController()
        let favorite = favorites[indexPath.row]
        print(favorite.description)
        print(favorite.tags ?? "frfef")
        vc.favorite = favorite
        navigationController?.pushViewController(vc, animated: true)
    }
}

