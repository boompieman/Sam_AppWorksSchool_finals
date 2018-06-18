//
//  File.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

class SingleSelectButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()

        setupButton()
    }

    private func setupButton() {

        self.layer.borderWidth = 1.0

        self.layer.borderColor = UIColor.darkGray.cgColor

        self.layer.cornerRadius = 7.5
    }

}
