//
//  GFTabBarController.swift
//  GithubFollowers
//
//  Created by Tilak Shakya on 07/07/24.
//

import UIKit

class GFTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().tintColor = .systemGreen
        viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
    }
    
    func createSearchNavigationController() -> UINavigationController {
        let searchVC = SearchViewController()
        searchVC.title = "Search"
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchVC)
    }
    
    func createFavoritesNavigationController() -> UINavigationController {
        let favoriteVC = FavoritesListViewController()
        favoriteVC.title = "Favorites"
        favoriteVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoriteVC)
    }
}
