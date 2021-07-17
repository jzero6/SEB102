//
//  FeedCategoryCell.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit

class FeedCategoryCell: UICollectionViewCell, CollectionViewCellConfigurable {
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var underlineImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? FilterCellData else { return }
        categoryLabel.text = data.title
        if data.check == true {
            categoryLabel.textColor = .gray
            underlineImage.image = UIImage(named: "ic-underLineBlue")!
        }
    }
}
