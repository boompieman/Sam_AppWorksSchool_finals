//
//  OrderListTableViewCell.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

class OrderListTableViewCell: UITableViewCell {

    @IBOutlet weak var orderIdLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var createdTimeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemsCountLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateWith(id: String, time: String, account: String, itemCount: Int, price: Int, status: OrderStatus) {

        orderIdLabel.text = id
        createdTimeLabel.text = time
        accountLabel.text = account
        itemsCountLabel.text = String(itemCount)
        priceLabel.text = String(price)
        statusLabel.text = status.getStatusString()
    }
    
}
