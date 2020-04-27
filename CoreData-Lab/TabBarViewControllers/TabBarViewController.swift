//
//  ViewController.swift
//  CoreData-Lab
//
//  Created by Juan Ceballos on 4/14/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    private lazy var photosViewController: PhotosViewController =   {
        let viewController = PhotosViewController()
        viewController.tabBarItem = UITabBarItem(title: "Photos", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        return viewController
    }()
    
    private lazy var favoritesViewController: FavoritesViewController = {
        let viewController = FavoritesViewController()
        viewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart"), tag: 0)
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        viewControllers = [UINavigationController(rootViewController: photosViewController), UINavigationController(rootViewController: favoritesViewController)]
    }

}

