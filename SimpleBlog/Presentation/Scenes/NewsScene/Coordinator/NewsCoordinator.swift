//
//  NewsCoordinator.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

final class NewsCoordinator: CoordinatorProtocol {
    //var productsManager: ProductsManagerProtocol?

    var navigationController: UINavigationController?
    
    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        
        let vc = NewsViewController.instantiateFromStoryboard()
        vc.coordinator = self
        self.navigationController?.viewControllers = [vc]
        //productsManager = ProductsManager()
    }
}
