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

    var orders = [Order]()

    var manager = OrderManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    func setupTableView() {

        let nib = UINib(nibName: String(describing: OrderListTableViewCell.self), bundle: nil)

        tableView.register(nib, forCellReuseIdentifier: String(describing: OrderListTableViewCell.self))

        tableView.dataSource = self

        tableView.delegate = self
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

extension OrderListViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.orders.count

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 140
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let tableViewCell =
            tableView.dequeueReusableCell(
                withIdentifier: String(describing: OrderListTableViewCell.self),
                for: indexPath
                ) as? OrderListTableViewCell else { return UITableViewCell()}

        let currentOrder = self.orders[indexPath.row]

        tableViewCell.updateWith(
            id: currentOrder.id,
            account: currentOrder.account,
            itemCount: currentOrder.itemCount,
            price: currentOrder.price)

        return tableViewCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension OrderListViewController: OrderManagerDelegate {
    func manager(_ manager: OrderManager, didGet orders: [Order]) {

        self.orders = orders
        self.tableView.reloadData()
    }
}
