//
//  ItemManager.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

protocol ItemManagerDelegate: class {

    func manager(_ manager: ItemManager, didGet items: [Item])

}

struct ItemManager {

    private let provider = ItemProvider()

    weak var delegate: ItemManagerDelegate?


    func getItems() {
        provider.getItemsFromFireBase { (items) in

            self.delegate?.manager(self, didGet: items)
        }
    }
}
