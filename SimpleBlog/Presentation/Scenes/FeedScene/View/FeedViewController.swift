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
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    
    private var tableViewDataSource: FeedTableViewDataSource!
    private var collectionViewDataSource: FeedCollectionViewDataSource!
    private var secondCollectionViewDataSource: FeedCollectionViewDataSource!
    private var viewModel:  FeedViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configureViewModel()
        setUpCollectionView()
        setUpCollectionView2()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: RecentCell.self)
        collectionView.registerNib(class: FeedCategoryCell.self)
        storiesCollectionView.registerNib(class: StoriesCell.self)
    }
        
    private func configureViewModel() {
        viewModel = FeedViewModel(controller: self)
        tableViewDataSource = FeedTableViewDataSource(with: tableView,viewModel: viewModel)
        collectionViewDataSource = FeedCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        secondCollectionViewDataSource = FeedCollectionViewDataSource(with: storiesCollectionView, viewModel: viewModel)
        tableViewDataSource.refresh()
        collectionViewDataSource.feedCategoryInfoRefresh()
        secondCollectionViewDataSource.storiedRefresh()
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
    private func setUpCollectionView2() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 134)
        storiesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 0)
        layout.minimumLineSpacing = 50
        storiesCollectionView.collectionViewLayout = layout
        storiesCollectionView.isPagingEnabled = true
    }
}
