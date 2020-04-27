//
//  DetailPhotosViewController.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/19/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit
import NetworkHelper

class DetailPhotosViewController: UIViewController {

    let detailPhotosView = DetailPhotosView()
    var photo: Photo?
    
    override func loadView() {
        view = detailPhotosView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        detailPhotosView.favoriteButton.addTarget(self, action: #selector(self.buttonPressed), for: .touchUpInside)
        updateUI()
    }
    
    @objc private func buttonPressed()    {
        guard let currentPhoto = photo
            else {
                return
        }
        _ = CoreDataManager.shared.createFavorite(id: String(currentPhoto.id), tags: currentPhoto.tags, previewURL: currentPhoto.previewURL, webformatURL: currentPhoto.webformatURL, photoURL: currentPhoto.largeImageURL, date: Date(), likes: String(currentPhoto.likes))
    }
    
    private func updateUI() {
        guard let currentPhoto = photo
            else    {
                return
        }
        
        detailPhotosView.photoImageView.setImage(with: currentPhoto.largeImageURL) { [weak self] (result) in
            switch result   {
            case .failure(let error):
                print("\(error)")
            case .success(let image):
                DispatchQueue.main.async {
                    self?.detailPhotosView.photoImageView.image = image
                }
            }
        }
    }

}
