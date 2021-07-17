//
//  NewsDataSource.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit

final class NewsDataSource: BaseCollectionViewDataSource {
    
    var viewModel: NewsViewModelProtocol!
    
    init(with collectionView: UICollectionView, viewModel: NewsViewModelProtocol!) {
        super.init()
        
        self.collectionView = collectionView
        self.viewModel = viewModel
        self.collectionView?.delegate = self
        singleSectionModels = []
    }
    
    override func refresh() {
        viewModel.fetchNews { [unowned self] result  in
            switch result {
            case .success(let news):
                DispatchQueue.main.async {
                    for new in news {
                        self.singleSectionModels.append(self.newsCell(data: new))
                    }
                    self.collectionView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }

}

// MARK: - CollectionView Cells
private extension NewsDataSource {
    private func newsCell(data: NewsModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: NewsCell.identifier,
                             userData: [.data: data])
    }
}

extension NewsDataSource: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0{
            return CGSize(width: UIScreen.main.bounds.size.width - 40, height: 196)
        } else {
            return CGSize(width: UIScreen.main.bounds.size.width / 2 - 30, height: 184)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
}

