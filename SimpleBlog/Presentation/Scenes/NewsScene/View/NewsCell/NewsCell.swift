//
//  NewsCell.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit
import Kingfisher

class NewsCell: UICollectionViewCell, CollectionViewCellConfigurable {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    private func setupLayout(){
        bgView.layer.cornerRadius = bgView.frame.height / 2
    }
    
    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? NewsModel else { return }
        bgView.backgroundColor = data.color?.color()
        mainImage.kf.setImage( with: URL(string: data.image ?? ""))
        titleLabel.text = data.title
        contentLabel.text = data.content
        categoryLabel.text = data.category
    }
}
