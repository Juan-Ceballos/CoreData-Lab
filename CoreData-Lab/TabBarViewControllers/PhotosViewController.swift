//
//  PhotosViewController.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    let photosView = PhotosView()
    
    override func loadView() {
        view = photosView
    }
    
    var photos = [Photo]()   {
        didSet  {
            DispatchQueue.main.async {
                self.photosView.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        navigationItem.title = "Photos"
        photosView.collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "photoCell")
        photosView.collectionView.dataSource = self
        photosView.collectionView.delegate = self
        photosView.searchBar.delegate = self
    }

}

extension PhotosViewController: UICollectionViewDataSource    {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? PhotoCell
            else    {
                fatalError()
        }
        let photo = photos[indexPath.row]
        cell.configureCell(photo: photo)
        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout    {
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
        let vc = DetailPhotosViewController()
        let photo = photos[indexPath.row]
        vc.photo = photo
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension PhotosViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        PBAPIClient.getPhotos(searchQuery: searchBar.text?.replacingOccurrences(of: " ", with: "+") ?? "") { [weak self] (result) in
            switch result   {
            case .failure(let error):
                print(error)
            case .success(let photos):
                self?.photos = photos
            }
        }
        searchBar.resignFirstResponder()
    }
}
