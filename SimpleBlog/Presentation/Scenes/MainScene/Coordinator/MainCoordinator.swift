//
//  MainCoordinator.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

final class MainCoordinator: CoordinatorProtocol {
    var categoryManager: CategoryManagerProtocol?

    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.navigationBar.isHidden = true
        
        let vc = MainViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.viewControllers = [vc]
        categoryManager = CategoryManager()
    }
}

