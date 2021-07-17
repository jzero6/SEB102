//
//  RecentBlogManager.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation

protocol RecentBlogManagerProtocol: AnyObject {
    func fetchRecentBlogs(completion: @escaping ((Result<[RecentBlogModel], Error>) -> Void))
}

class RecentBlogManager: RecentBlogManagerProtocol {
    func fetchRecentBlogs(completion: @escaping ((Result<[RecentBlogModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/8e7acf6d-30fd-4467-ac33-8a19756267e4"
        NetworkManager.shared.get(url: url) { (result: Result<[RecentBlogModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
