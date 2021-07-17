//
//  MainViewModel.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import Foundation

protocol MainViewModelProtocol {

    func fetchCategory(completion: @escaping ((Result<[CategoryModel], Error>) -> Void))
    
    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class MainViewModel: MainViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
    func fetchCategory(completion: @escaping ((Result<[CategoryModel], Error>) -> Void)){
        controller.coordinator?.categoryManager?.fetchCategory(completion: completion)
    }
}
