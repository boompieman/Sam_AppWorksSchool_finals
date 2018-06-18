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
}
