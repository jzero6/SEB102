//
//  FeedViewModel.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation

protocol FeedViewModelProtocol {
    
    func fetchRecentBlogs(completion: @escaping ((Result<[RecentBlogModel], Error>) -> Void))
    
    func fetchStories(completion: @escaping ((Result<[StoryModel], Error>) -> Void))

    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class FeedViewModel: FeedViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchRecentBlogs(completion: @escaping ((Result<[RecentBlogModel], Error>) -> Void)){
        controller.coordinator?.recentBlogManager?.fetchRecentBlogs(completion: completion)
    }
    
    func fetchStories(completion: @escaping ((Result<[StoryModel], Error>) -> Void)){
        controller.coordinator?.storyManager?.fetchStories(completion: completion)
    }
}
