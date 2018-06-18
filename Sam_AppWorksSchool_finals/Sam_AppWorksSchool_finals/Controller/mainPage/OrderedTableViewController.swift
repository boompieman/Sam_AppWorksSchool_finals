//
//  OrderedTableViewController.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

class OrderedTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var selectedItems = [Item]()

    override func viewDidLoad() {
        setUpTableView()
    }

    func setUpTableView() {
        
        let nib = UINib(nibName: String(describing: OrderedItemTableViewCell.self), bundle: nil)

        tableView.register(nib, forCellReuseIdentifier: String(describing: OrderedItemTableViewCell.self))

//        tableView.contentInset = OLConstants.tableViewInset

        tableView.dataSource = self

        tableView.delegate = self
    }
}

extension OrderedTableViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return selectedItems.count

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let tableViewCell =
        tableView.dequeueReusableCell(
        withIdentifier: String(describing: OrderedItemTableViewCell.self),
        for: indexPath
        ) as? OrderedItemTableViewCell else { return UITableViewCell()}

        tableViewCell.updateWith(name: selectedItems[indexPath.row].name, imageUrl: selectedItems[indexPath.row].image)
        
        return tableViewCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        var actionArray = [UITableViewRowAction]()
        let actionDelete = UITableViewRowAction(style: .default, title: OLConstants.delete) { (_, indexPath) in
            self.selectedItems.remove(at: indexPath.row)

            self.tableView.reloadData()
        }

        actionDelete.backgroundColor = UIColor.red
        actionArray.append(actionDelete)

        return actionArray
    }
}
