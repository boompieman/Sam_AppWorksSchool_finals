//
//  OrderList.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

class OrderListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var manager = OrderManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        requestOrders()
    }

    func requestOrders() {
        manager.delegate = self
        manager.getOrders()
    }

}

extension OrderListViewController: OrderManagerDelegate {
    func manager(_ manager: OrderManager, didGet items: [Order]) {
        print(items)
    }


}
