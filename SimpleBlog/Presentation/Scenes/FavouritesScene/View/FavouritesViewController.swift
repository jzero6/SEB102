//
//  FavouritesViewController.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

class FavouritesViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageIndicator: UIPageControl!

    private var dataSource: FavouritesDataSource!
    private var viewModel:  FavouritesViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configureViewModel()
        setUpCollectionView()
    }
    
    private func setupLayout() {
        collectionView.registerNib(class: FavouritesCell.self)
    }
        
    private func configureViewModel() {
        viewModel = FavouritesViewModel(controller: self)
        dataSource = FavouritesDataSource(with: collectionView, viewModel: viewModel)
        dataSource.favouritesCellRefresh()
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 260, height: 470)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: -(260-((UIScreen.main.bounds.size.width - 280) / 2)) , bottom: 0, right: 0)
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
}

extension FavouritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 260, height: 470)
    }
}
