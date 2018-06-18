//
//  CollectionViewCell.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit
import SDWebImage


class ItemCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateWith(imageUrl: String) {

        self.imageView.sd_setImage(with: URL(string: imageUrl), completed: nil)

    }

}
