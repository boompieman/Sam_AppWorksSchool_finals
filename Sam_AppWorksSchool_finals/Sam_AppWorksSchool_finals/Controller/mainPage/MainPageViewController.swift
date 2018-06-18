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

    override func viewDidLoad() {

        let typeListVC = childViewControllers[0] as? TypeListCollectionViewController

        typeListVC?.delegate = self
    }
}

extension MainPageViewController: TypeListCollectionViewControllerDelegate {


    func itemDidSelect(_ controller: TypeListCollectionViewController, didSelect item: Item) {

        let selectedListVC = childViewControllers[1] as? OrderedTableViewController

        selectedListVC?.selectedItems.append(item)

        selectedListVC?.tableView.reloadData()
    }


}
