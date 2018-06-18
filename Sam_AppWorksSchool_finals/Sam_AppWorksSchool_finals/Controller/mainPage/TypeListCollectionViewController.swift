//
//  TypeListCollectionViewController.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit


class TypeListCollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var manager = ItemManager()
    
    override func viewDidLoad() {

        manager.delegate = self

        manager.getItems()

    }
}

extension TypeListCollectionViewController: ItemManagerDelegate {
    func manager(_ manager: ItemManager, didGet items: [Item]) {
        print("controller: ", items)
    }


}
