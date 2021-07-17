//
//  StoryManager.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation

protocol StoryManagerProtocol: AnyObject {
    func fetchStories(completion: @escaping ((Result<[StoryModel], Error>) -> Void))
}

class StoryManager: StoryManagerProtocol {
    func fetchStories(completion: @escaping ((Result<[StoryModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/73cc019d-e77b-4c66-9e8b-6d9b44acd39b"
        NetworkManager.shared.get(url: url) { (result: Result<[StoryModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
