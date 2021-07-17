//
//  MainViewController.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    private var tableViewDataSource: MainTableViewDataSource!
    private var collectionViewDataSource: MainCollectionViewDataSource!
    private var viewModel:  MainViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        setupLayout()
        configureViewModel()
        setUpCollectionView()
    }
    
    private func setupLayout() {
        tableView.registerNib(class: CategoryCell.self)
        collectionView.registerNib(class: FilterCell.self)
    }
        
    private func configureViewModel() {
        viewModel = MainViewModel(controller: self)
        tableViewDataSource = MainTableViewDataSource(with: tableView,viewModel: viewModel)
        collectionViewDataSource = MainCollectionViewDataSource(with: collectionView, viewModel: viewModel)
        tableViewDataSource.refresh()
        collectionViewDataSource.filterInfoRefresh()
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 40)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20 , bottom: 0, right: 0)
        layout.minimumLineSpacing = 20
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 40)
    }
}
