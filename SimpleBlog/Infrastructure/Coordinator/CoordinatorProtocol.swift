//
//  CoordinatorProtocol.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    //var productsManager: ProductsManagerProtocol? { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
}

extension CoordinatorProtocol {
//    var productsManager: ProductsManagerProtocol? {
//        set { print("") }
//        get { nil }
//    }

    func start(){}
}
