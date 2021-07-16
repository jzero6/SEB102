//
//  CoordinatorDelegate.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

protocol CoordinatorDelegate: UIViewController{
    var coordinator: CoordinatorProtocol? { get set }
}
