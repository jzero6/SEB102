//
//  BaseCollectionViewDataSource.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

class BaseCollectionViewDataSource: NSObject {
    
    var singleSectionModels: [CellItem]!
    var multiSectionModels: [[CellItem]]!
    
    weak var collectionView: UICollectionView? {
        didSet {
            collectionView?.dataSource = self
        }
    }
    
    func refresh() {
        
    }
    
    func initCustomCollectionViewCell(for indexPath: IndexPath, with cellIdentifier: String) -> UICollectionViewCell? {
        return nil
    }
}

extension BaseCollectionViewDataSource: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if singleSectionModels != nil {
            return 1
        } else if multiSectionModels != nil {
            return multiSectionModels.count
        } else {
            fatalError("No models set up!")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items(for: section).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = items(for: indexPath.section)[indexPath.row]
        let cell: UICollectionViewCell
        
        
        switch cellViewModel.cellIdentifier {
//        case SomeProductsItemCell.identifier:
//            cell = collectionView.deque(SomeProductsItemCell.self, for: indexPath)
        default:
            if let _cell = initCustomCollectionViewCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        
        if let configurableCell = cell as? CollectionViewCellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    func items(for section: Int) -> [CellItem] {
        if singleSectionModels != nil {
            return singleSectionModels
        } else if multiSectionModels != nil {
            return multiSectionModels[section]
        } else {
            fatalError("No models set up!")
        }
    }
}

protocol CollectionViewCellConfigurable: UICollectionViewCell {
    func configure(with item: CellItem)
}