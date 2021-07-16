//
//  TabBarController.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

class TabBarController:  UITabBarController, Storyboarded, CoordinatorDelegate  {

    private var mainCoordinator = MainCoordinator()
    private var favouritesCoordinator = FavouritesCoordinator()
    private var newsCoordinator = NewsCoordinator()
    private var feedCoordinator = FeedCoordinator()
    
    var coordinator: CoordinatorProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.viewControllers![0] = mainCoordinator.navigationController!
        self.viewControllers![1] = favouritesCoordinator.navigationController!
        self.viewControllers![2] = newsCoordinator.navigationController!
        self.viewControllers![3] = feedCoordinator.navigationController!
    }

}
