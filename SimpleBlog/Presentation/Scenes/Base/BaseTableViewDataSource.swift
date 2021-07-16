//
//  BaseTableViewDataSource.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

class BaseTableViewDataSource: NSObject {
    
    var singleSectionModels: [CellItem]!
    var multiSectionModels: [[CellItem]]!
    var coordinator: CoordinatorDelegate!
    
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
        }
    }
    
    func refresh() {
        
    }
    
    func initCustomCell(for indexPath: IndexPath, with cellIdentifier: String) -> UITableViewCell? {
        return nil
    }
}

extension BaseTableViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if singleSectionModels != nil {
            return 1
        } else if multiSectionModels != nil {
            return multiSectionModels.count
        } else {
            fatalError("No models set up!")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items(for: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = items(for: indexPath.section)[indexPath.row]
        let coordinator = coordinator.coordinator
        let cell: UITableViewCell
        
        
        switch cellViewModel.cellIdentifier {
        //case CategoryCell.identifier:
            //cell = tableView.deque(CategoryCell.self, for: indexPath)
        default:
            if let _cell = initCustomCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        
        if let configurableCell = cell as? CellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        if let configurableTableCell = cell as? TableCellConfigurable {
            configurableTableCell.configure(with: coordinator!)
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

protocol TableCellConfigurable: UITableViewCell {
    func configure(with coordinator: CoordinatorProtocol)
}

protocol CellConfigurable: UITableViewCell {
    func configure(with item: CellItem)
}

protocol CellItem {
    var cellIdentifier: String { get }
}

struct CellViewModel: CellItem {
    
    private(set) var cellIdentifier: String
    
    let userData: [CellViewModelUserDataKey: Any]
    
    init(cellIdentifier: String,
         userData: [CellViewModelUserDataKey: Any]? = nil) {
        self.cellIdentifier = cellIdentifier
        self.userData = userData ?? [:]
    }
}

enum CellViewModelUserDataKey {
    case data
}


