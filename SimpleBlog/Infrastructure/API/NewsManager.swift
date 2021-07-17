//
//  NewsManager.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation

protocol NewsManagerProtocol: AnyObject {
    func fetchNews(completion: @escaping ((Result<[NewsModel], Error>) -> Void))
}

class NewsManager: NewsManagerProtocol {
    func fetchNews(completion: @escaping ((Result<[NewsModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/948e9dbb-1b4b-4af8-b86b-406663687e49"
        NetworkManager.shared.get(url: url) { (result: Result<[NewsModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
