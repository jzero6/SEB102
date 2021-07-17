//
//  FeedViewModel.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation

protocol FeedViewModelProtocol {

    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class FeedViewModel: FeedViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
}
