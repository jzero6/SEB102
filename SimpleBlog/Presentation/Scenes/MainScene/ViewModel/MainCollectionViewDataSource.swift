//
//  MainCollectionViewDataSource.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

final class MainCollectionViewDataSource: BaseCollectionViewDataSource {
    
    var viewModel: MainViewModelProtocol!
    
    init(with collectionView: UICollectionView, viewModel: MainViewModelProtocol!) {
        super.init()
        
        self.collectionView = collectionView
        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    func filterInfoRefresh(){
        let data0 = FilterCellData(title: "Latest", check: true)
        let data1 = FilterCellData(title: "Featured", check: false)
        let data2 = FilterCellData(title: "Nearby", check: false)
        let data3 = FilterCellData(title: "Popular", check: false)
        self.singleSectionModels.append(self.filterCell(data: data0))
        self.singleSectionModels.append(self.filterCell(data: data1))
        self.singleSectionModels.append(self.filterCell(data: data2))
        self.singleSectionModels.append(self.filterCell(data: data3))
    }

}

// MARK: - CollectionView Cells
private extension MainCollectionViewDataSource {
    private func filterCell(data: FilterCellData) -> CellViewModel {
        return CellViewModel(cellIdentifier: FilterCell.identifier,
                             userData: [.data: data])
    }
}
