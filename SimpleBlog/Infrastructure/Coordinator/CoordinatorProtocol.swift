//
//  CoordinatorProtocol.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    
    var categoryManager: CategoryManagerProtocol? { get }
    var recentBlogManager: RecentBlogManagerProtocol? { get }
    var storyManager: StoryManagerProtocol? { get }
    var newsManager: NewsManagerProtocol? { get }
    
    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
}

extension CoordinatorProtocol {
    var categoryManager: CategoryManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var recentBlogManager: RecentBlogManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var storyManager: StoryManagerProtocol? {
        set { print("") }
        get { nil }
    }
    var newsManager: NewsManagerProtocol? {
        set { print("") }
        get { nil }
    }

    func start(){}
}
