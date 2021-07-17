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
    
    override func refresh() {
        viewModel.fetchRecentBlogs { [unowned self] result  in
            switch result {
            case .success(let blogs):
                DispatchQueue.main.async {
                    for blog in blogs {
                        self.singleSectionModels.append(self.recentCell(data: blog))
                    }
                    self.tableView?.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }

}

// MARK: - TableView Cells
private extension FeedTableViewDataSource {

    private func recentCell(data: RecentBlogModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: RecentCell.identifier,
                             userData: [.data: data])
    }
}

extension FeedTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

