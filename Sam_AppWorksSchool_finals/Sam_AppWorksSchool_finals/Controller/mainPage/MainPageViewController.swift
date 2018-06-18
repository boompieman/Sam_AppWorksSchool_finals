//
//  mainPageViewController.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

class MainPageViewController: UIViewController {

    let manager = OrderManager()

    override func viewDidLoad() {

        let typeListVC = childViewControllers[0] as? TypeListCollectionViewController

        typeListVC?.delegate = self
    }

    @IBAction func SendBtnDidTapped(_ sender: Any) {

        manager.writeOrders(order: Order(id: "", content: [Content(name: "Latte", cups: 5, iced: true, sugar: true), Content(name: "Latte", cups: 3, iced: false, sugar: true), Content(name: "Mocha", cups: 4, iced: false, sugar: true)], time: 123, account: "aaa", itemCount: 10, price: 500, statusIndex: 0, status: nil, timeString: nil))

    }

}

extension MainPageViewController: TypeListCollectionViewControllerDelegate {


    func itemDidSelect(_ controller: TypeListCollectionViewController, didSelect item: Item) {

        let selectedListVC = childViewControllers[1] as? OrderedTableViewController

        selectedListVC?.selectedItems.append(item)

        selectedListVC?.tableView.reloadData()
    }


}
