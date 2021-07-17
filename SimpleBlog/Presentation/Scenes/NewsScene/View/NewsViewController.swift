//
//  NewsViewController.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var dataSource: NewsDataSource!
    private var viewModel: NewsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configureViewModel()
    }
    
    private func setupLayout() {
        collectionView.registerNib(class: NewsCell.self)
    }
        
    private func configureViewModel() {
        viewModel = NewsViewModel(controller: self)
        dataSource = NewsDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
    }

}
