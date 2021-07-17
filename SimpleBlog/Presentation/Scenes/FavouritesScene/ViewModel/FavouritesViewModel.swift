//
//  FavouritesViewModel.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import Foundation

protocol FavouritesViewModelProtocol {

    var controller: CoordinatorDelegate { get }
    
    init(controller: CoordinatorDelegate)
}

final class FavouritesViewModel: FavouritesViewModelProtocol {
    
    private(set) var controller: CoordinatorDelegate
    
    init(controller: CoordinatorDelegate) {
        self.controller = controller
    }
    
}
