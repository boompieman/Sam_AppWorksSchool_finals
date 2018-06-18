//
//  OrderedItemTableViewCell.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

class OrderedItemTableViewCell: UITableViewCell {

    @IBOutlet weak var sugarNoButton: SingleSelectButton!
    @IBOutlet weak var sugarYesButton: SingleSelectButton!
    @IBOutlet weak var hotButton: SingleSelectButton!
    @IBOutlet weak var icedButton: SingleSelectButton!
    @IBOutlet weak var selectedNameLabel: UILabel!

    @IBOutlet weak var selectedImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateWith(name: String, imageUrl: String) {
        self.selectedNameLabel.text = name
        self.selectedImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
    }

    func BtnDidSelected() {

    }
}
