//
//  CoordinatorProtocol.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var categoryManager: CategoryManagerProtocol? { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
}

extension CoordinatorProtocol {
    var categoryManager: CategoryManagerProtocol? {
        set { print("") }
        get { nil }
    }

    func start(){}
}
