//
//  OLStatusFormatter.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation

class OLStatusFormatter {

    func statusFormatWith(statusIndex: Int) -> OrderStatus {

        switch statusIndex {

        case 0:
            return OrderStatus.Completed
        case 1:
            return OrderStatus.Ready
        case 2:
            return OrderStatus.Processing
        default:
            return OrderStatus.Canceled
        }
    }

}
