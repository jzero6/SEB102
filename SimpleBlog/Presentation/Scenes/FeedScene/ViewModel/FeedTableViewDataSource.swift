//
//  FeedTableViewDataSource.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit

final class FeedTableViewDataSource: BaseTableViewDataSource {
    
    var viewModel: FeedViewModelProtocol!
    
    init(with tableView: UITableView, viewModel: FeedViewModelProtocol) {
        super.init()
        
        self.viewModel = viewModel
        self.tableView = tableView
        self.tableView?.delegate = self
        
        singleSectionModels = []
    }

}

// MARK: - TableView Cells
private extension MainTableViewDataSource {

    private func recentCell(data: CategoryModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: RecentCell.identifier,
                             userData: [.data: data])
    }
}

extension FeedTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

