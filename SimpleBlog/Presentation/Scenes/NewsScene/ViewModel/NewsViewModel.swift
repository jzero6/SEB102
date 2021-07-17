//
//  NewsViewModel.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation

protocol NewsViewModelProtocol {
    
    func fetchNews(completion: @escaping ((Result<[NewsModel], Error>) -> Void))

    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class NewsViewModel: NewsViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchNews(completion: @escaping ((Result<[NewsModel], Error>) -> Void)){
        controller.coordinator?.newsManager?.fetchNews(completion: completion)
    }
}
