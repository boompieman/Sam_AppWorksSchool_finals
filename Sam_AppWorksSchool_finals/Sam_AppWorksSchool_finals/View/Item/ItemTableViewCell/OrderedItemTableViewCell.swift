//
//  OrderedItemTableViewCell.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

protocol OrderedItemTableViewCellDelegate: class {
    func didIcedHotButtonPressed(_ cell: OrderedItemTableViewCell, iced: Bool)

    func didSugarButtonPressed(_ cell: OrderedItemTableViewCell, isSugar: Bool)
}

class OrderedItemTableViewCell: UITableViewCell {


    weak var delegate: OrderedItemTableViewCellDelegate?

    @IBOutlet weak var sugarNoButton: SingleSelectButton!
    @IBOutlet weak var sugarYesButton: SingleSelectButton!
    @IBOutlet weak var hotButton: SingleSelectButton!
    @IBOutlet weak var icedButton: SingleSelectButton!
    @IBOutlet weak var selectedNameLabel: UILabel!

    @IBOutlet weak var selectedImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        sugarYesButton.isSelected = true
        icedButton.isSelected = true

    }

    func updateWith(name: String, imageUrl: String) {
        self.selectedNameLabel.text = name
        self.selectedImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
    }

    @IBAction func icedBtnDidTapped(_ sender: UIButton) {

        if sender.isSelected {
            return
        }

        self.icedButton.isSelected = !self.icedButton.isSelected

        self.hotButton.isSelected = !self.hotButton.isSelected

        self.delegate?.didIcedHotButtonPressed(self, iced: true)
    }


    @IBAction func hotBtnDidTapped(_ sender: UIButton) {

        if sender.isSelected {
            return
        }

        self.icedButton.isSelected = !self.icedButton.isSelected

        self.hotButton.isSelected = !self.hotButton.isSelected

        self.delegate?.didIcedHotButtonPressed(self, iced: false)
    }

    @IBAction func sugarYesBtnDidTapped(_ sender: UIButton) {

        if sender.isSelected {
            return
        }

        self.sugarYesButton.isSelected = !self.sugarYesButton.isSelected

        self.sugarNoButton.isSelected = !self.sugarNoButton.isSelected

        self.delegate?.didSugarButtonPressed(self, isSugar: true)
    }


    @IBAction func sugarNoBtnDidTapped(_ sender: UIButton) {

        if sender.isSelected {
            return
        }

        self.sugarYesButton.isSelected = !self.sugarYesButton.isSelected

        self.sugarNoButton.isSelected = !self.sugarNoButton.isSelected

        self.delegate?.didSugarButtonPressed(self, isSugar: false)
    }

}
