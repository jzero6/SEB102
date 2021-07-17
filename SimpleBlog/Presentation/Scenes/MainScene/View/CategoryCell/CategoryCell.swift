//
//  CategoryCell.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 16.07.21.
//

import UIKit
import Kingfisher

class CategoryCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var blogerImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupLayout() {
        mainImage.layer.cornerRadius = 20
        blogerImage.layer.cornerRadius = blogerImage.frame.width / 2
        blogerImage.layer.borderWidth = 2
        blogerImage.layer.borderColor = UIColor.white.cgColor
    }
    
    func configure(with item: CellItem){
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? CategoryModel else { return }
        mainImage.kf.setImage( with: URL(string: data.image ?? ""))
        blogerImage.kf.setImage( with: URL(string: data.smallImage ?? ""))
        categoryTitle.text = data.title
    }
    
}
