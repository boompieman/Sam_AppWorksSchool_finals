//
//  orderList.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation

struct Order {

    let id: String
    let content: [Content]
    let time: Int
    let account: String
    let itemCount: Int
    let price: Int
    let statusIndex: Int
    var status: OrderStatus?
    var timeString: String?
}

struct Content {

    let name: String
    let cups: Int
    let iced: Bool
    let sugar: Bool

}


enum OrderStatus {

    case Processing

    case Completed

    case Canceled

}
