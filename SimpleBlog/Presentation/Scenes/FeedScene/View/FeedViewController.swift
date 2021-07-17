//
//  FeedViewController.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

class FeedViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewDataSource: FeedTableViewDataSource!
    private var collectionViewDataSource: FeedCollectionViewDataSource!
    private var viewModel:  FeedViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configureViewModel()
        setUpCollectionView()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: RecentCell.self)
        collectionView.registerNib(class: FeedCategoryCell.self)
    }
        
    private func configureViewModel() {
        viewModel = FeedViewModel(controller: self)
        tableViewDataSource = FeedTableViewDataSource(with: tableView,viewModel: viewModel)
        collectionViewDataSource = FeedCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        //tableViewDataSource.categoryInfoRefresh()
        collectionViewDataSource.feedCategoryInfoRefresh()
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 32)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 0)
        layout.minimumLineSpacing = 50
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 32)
    }
}
