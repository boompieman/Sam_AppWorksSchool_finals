//
//  OrderListManager.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//


protocol OrderManagerDelegate: class {

    func manager(_ manager: OrderManager, didGet items: [Order])

}

struct OrderManager {

    private let provider = OrderProvider()

    weak var delegate: OrderManagerDelegate?

    func getOrders() {
        provider.getOrdersFromFireBase { (orders) in

            print("manager")
            self.delegate?.manager(self, didGet: orders)
        }
    }
}
