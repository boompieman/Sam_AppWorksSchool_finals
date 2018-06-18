//
//  OLJsonParser.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation

class OLJsonParser {

    func parseToItems(value: [AnyObject]) -> [Item] {

        var items = [Item]()

        for val in value {
            guard let name = val["name"] as? String, let price = val["price"] as? Int, let image = val["image"] as? String else { return items }

            let item = Item(name: name, price: price, image: image)
            items.append(item)
        }

        return items

    }


}
