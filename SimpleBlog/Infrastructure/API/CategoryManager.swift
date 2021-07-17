//
//  CategoryManager.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation

protocol CategoryManagerProtocol: AnyObject {
    func fetchCategory(completion: @escaping ((Result<[CategoryModel], Error>) -> Void))
}

class CategoryManager: CategoryManagerProtocol {
    func fetchCategory(completion: @escaping ((Result<[CategoryModel], Error>) -> Void)) {
        let url = "https://run.mocky.io/v3/a8ee55d5-ebc0-4779-ac9f-b4c06bd3439a"
        NetworkManager.shared.get(url: url) { (result: Result<[CategoryModel], Error>) in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
