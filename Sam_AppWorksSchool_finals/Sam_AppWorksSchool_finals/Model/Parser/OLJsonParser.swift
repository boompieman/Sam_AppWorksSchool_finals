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

    func parseToOrders(orders: [String:AnyObject]) -> [Order] {

        var orderLists = [Order]()

        for order in orders {

            let id = order.key

            let orderStatus: OrderStatus

            guard let account = order.value["account"] as? String, let itemCount = order.value["itemCount"] as? Int, let price = order.value["price"] as? Int, let time = order.value["time"] as? Int, let statusIndex = order.value["status"] as? Int else {

                return orderLists}

            var contentList = [Content]()

            print(order.value["content"])



            guard let contents = order.value["content"] as? [String: [AnyObject]] else {

                return orderLists }

            for content in contents {

                let name = content.key

                for differentOrder in content.value {
                    guard let cups = differentOrder["cups"] as? Int, let isIced = differentOrder["iced"] as? Bool, let isSugar = differentOrder["sugar"] as? Bool else { return orderLists }
                    contentList.append(Content(name: name, cups: cups, iced: isIced, sugar: isSugar))
                }
            }

            orderLists.append(Order(id: id, content: contentList, time: time, account: account, itemCount: itemCount, price: price, statusIndex: statusIndex, status: nil, timeString: nil))
        }

        print(orderLists.count)



        return orderLists

    }

}
