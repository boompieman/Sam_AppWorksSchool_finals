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

        self.layer.masksToBounds = true

        self.setBackgroundColor(color: UIColor.clear, forState: .normal)

        self.setBackgroundColor(color: UIColor.yellow, forState: .selected)
        
    }

}

extension UIButton {

    func setBackgroundColor(color: UIColor, forState: UIControlState) {

        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        self.setBackgroundImage(colorImage, for: forState)
    }
}
