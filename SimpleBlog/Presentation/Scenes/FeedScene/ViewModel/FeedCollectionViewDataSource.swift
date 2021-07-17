//
//  FeedCollectionViewDataSource.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit

final class FeedCollectionViewDataSource: BaseCollectionViewDataSource {
    
    var viewModel: FeedViewModelProtocol!
    
    init(with collectionView: UICollectionView, viewModel: FeedViewModelProtocol!) {
        super.init()
        
        self.collectionView = collectionView
        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    func feedCategoryInfoRefresh(){
        let data0 = FilterCellData(title: "Recent", check: true)
        let data1 = FilterCellData(title: "Popular", check: false)
        let data2 = FilterCellData(title: "Nearby", check: false)
        self.singleSectionModels.append(self.feedCategoryCell(data: data0))
        self.singleSectionModels.append(self.feedCategoryCell(data: data1))
        self.singleSectionModels.append(self.feedCategoryCell(data: data2))
        
        collectionView?.reloadData()
    }
    
    func storiedRefresh() {
        viewModel.fetchStories { [unowned self] result  in
            switch result {
            case .success(let stories):
                DispatchQueue.main.async {
                    for story in stories {
                        self.singleSectionModels.append(self.storiesCell(data: story))
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
private extension FeedCollectionViewDataSource {
    private func feedCategoryCell(data: FilterCellData) -> CellViewModel {
        return CellViewModel(cellIdentifier: FeedCategoryCell.identifier,
                             userData: [.data: data])
    }
    private func storiesCell(data: StoryModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: StoriesCell.identifier,
                             userData: [.data: data])
    }
}

