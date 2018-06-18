//
//  OrderListManager.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//


protocol OrderManagerDelegate: class {

    func manager(_ manager: OrderManager, didGet orders: [Order])

}

struct OrderManager {

    private let provider = OrderProvider()

    weak var delegate: OrderManagerDelegate?

    private let timeFormatter = OLTimeFormatter()

    private let statusFormatter = OLStatusFormatter()

    func getOrders() {
        provider.getOrdersFromFireBase { (orders) in

            var orderList = orders

            

            for (index, item) in orderList.enumerated() {


                orderList[index].timeString = self.timeFormatter.dateWithUnitTime(time: Double(orderList[index].time))

                orderList[index].status = self.statusFormatter.statusFormatWith(statusIndex: orderList[index].statusIndex)
            }

            self.delegate?.manager(self, didGet: orderList)
        }
    }

    func writeOrders(order: Order) {
        provider.writeOrdersToFireBase(order: order)
    }
}
