//
//  StoriesCell.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit
import Kingfisher

class StoriesCell: UICollectionViewCell, CollectionViewCellConfigurable {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        mainImage.layer.cornerRadius = mainImage.frame.height / 2
    }

    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? StoryModel else { return }
        mainImage.kf.setImage( with: URL(string: data.image ?? ""))
        titleLabel.text = data.title
    }
}
