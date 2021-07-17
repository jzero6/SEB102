//
//  RecentCell.swift
//  SimpleBlog
//
//  Created by Nana Jimsheleishvili on 17.07.21.
//

import UIKit
import Kingfisher

class RecentCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var blogerImage: UIImageView!
    @IBOutlet weak var blogerLabel: UILabel!
    @IBOutlet weak var blogTitle: UILabel!
    @IBOutlet weak var blogCategory: UILabel!
    @IBOutlet weak var blogTime: UILabel!
    @IBOutlet weak var categoryView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupLayout() {
        categoryView.layer.cornerRadius = categoryView.frame.width / 2
        blogerImage.layer.cornerRadius = blogerImage.frame.width / 2
        mainImage.layer.cornerRadius = 22
    }
    
    func configure(with item: CellItem){
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? RecentBlogModel else { return }
        mainImage.kf.setImage( with: URL(string: data.image ?? ""))
        blogerImage.kf.setImage( with: URL(string: data.blogerImage ?? ""))
        blogerLabel.text = data.bloger
        blogTime.text = data.time
        blogCategory.text = data.category
        blogTitle.text = data.title
        categoryView.backgroundColor = data.color?.color()
    }
}
