//
//  FilterCell.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit

class FilterCell: UICollectionViewCell, CollectionViewCellConfigurable {
    
    @IBOutlet weak var filterLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? FilterCellData else { return }
        filterLabel.text = data.title
        if data.check == true {
            filterLabel.layer.backgroundColor = UIColor(named: "FilterLabelColor")!.cgColor
            filterLabel.layer.cornerRadius = filterLabel.frame.height / 2
            filterLabel.layer.borderWidth = 2
            filterLabel.layer.borderColor = UIColor.lightGray.cgColor
            filterLabel.textColor = .black
        }
    }
    

}
