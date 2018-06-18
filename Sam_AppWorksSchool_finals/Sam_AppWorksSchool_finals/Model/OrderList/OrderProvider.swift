//
//  OrderListProvider.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation


struct OrderProvider {

    private let firebaseClient = OLFireBase()

    private let parser = OLJsonParser()

    func getOrdersFromFireBase(success: @escaping ([Order]) -> Void) {

        firebaseClient.child("orders").observeSingleEvent(of: .value, with: { (snapshot) in

            

            guard let value = snapshot.value as? [String:AnyObject] else {
                print("null")
                return
            }

            success(self.parser.parseToOrders(orders: value))
        })
    }

    func writeOrdersToFireBase(order: Order) {

        let orderDict = ["account": order.account,
                         "itemCount": order.itemCount,
                         "price": order.price,
                         "status": order.statusIndex,
                         "time": order.time] as [String : Any]

        let orderID = firebaseClient.child("orders").childByAutoId()

        orderID.setValue(orderDict)

        for (index,item) in order.content.enumerated() {

            let contentDict = ["cups": item.cups,
                               "iced": item.iced,
                               "sugar": item.sugar] as [String : Any]
            orderID.child("content").child(item.name).child(String(index)).updateChildValues(contentDict)
        }

    }
}
