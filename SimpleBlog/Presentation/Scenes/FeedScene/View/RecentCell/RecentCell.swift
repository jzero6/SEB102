//
//  RecentCell.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit
import Kingfisher

class RecentCell: UITableViewCell, CellConfigurable {

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupLayout() {

    }
    
    func configure(with item: CellItem){
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? CategoryModel else { return }
        //mainImage.kf.setImage( with: URL(string: data.image ?? ""))

    }
}
