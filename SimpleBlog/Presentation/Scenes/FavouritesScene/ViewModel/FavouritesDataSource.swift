//
//  FavouritesDataSource.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit

final class FavouritesDataSource: BaseCollectionViewDataSource {
    
    var viewModel: FavouritesViewModelProtocol!
    
    init(with collectionView: UICollectionView, viewModel: FavouritesViewModelProtocol!) {
        super.init()
        
        self.collectionView = collectionView
        self.viewModel = viewModel
        
        singleSectionModels = []
    }
    
    func favouritesCellRefresh(){
        let data0 = FavouritesCellData(underLine: UIImage.init(), category: "", title: "", content: "", bookmark: UIImage.init(), check: false)
        let data1 = FavouritesCellData(underLine: UIImage(named: "ic-underscore")!, category: "My Favourites", title: "Morning Flowers", content: "Morning flowers burst, \nThe sun warming \ntheir petals.", bookmark: UIImage(named: "ic-bookmark")!, check: true)
        let data2 = FavouritesCellData(underLine: UIImage(named: "ic-underscoreNot")!, category: "Bookmarks", title: "", content: "", bookmark: UIImage.init(), check: false)
        self.singleSectionModels.append(favouritesCell(data: data0))
        self.singleSectionModels.append(favouritesCell(data: data1))
        self.singleSectionModels.append(favouritesCell(data: data2))
    }

}

// MARK: - CollectionView Cells
private extension FavouritesDataSource {
    private func favouritesCell(data: FavouritesCellData) -> CellViewModel {
        return CellViewModel(cellIdentifier: FavouritesCell.identifier,
                             userData: [.data: data])
    }
}
