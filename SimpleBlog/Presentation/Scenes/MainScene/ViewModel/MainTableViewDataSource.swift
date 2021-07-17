//
//  MainDataSource.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

final class MainTableViewDataSource: BaseTableViewDataSource {
    
    var viewModel: MainViewModelProtocol!
    
    init(with tableView: UITableView, viewModel: MainViewModelProtocol) {
        super.init()
        
        self.viewModel = viewModel
        self.tableView = tableView
        self.tableView?.delegate = self
        
        singleSectionModels = []
    }
    
    func categoryInfoRefresh(){
        viewModel.fetchCategory { [unowned self] result  in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    for category in categories {
                        self.singleSectionModels.append(self.categoryCell(data: category))
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
private extension MainTableViewDataSource {

    private func categoryCell(data: CategoryModel) -> CellViewModel {
        return CellViewModel(cellIdentifier: CategoryCell.identifier,
                             userData: [.data: data])
    }
}

extension MainTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
