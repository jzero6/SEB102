//
//  FeedCoordinator.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

final class FeedCoordinator: CoordinatorProtocol {
    //var productsManager: ProductsManagerProtocol?

    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.navigationBar.isHidden = true
        
        let vc = FeedViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.viewControllers = [vc]
        //productsManager = ProductsManager()
    }
}
