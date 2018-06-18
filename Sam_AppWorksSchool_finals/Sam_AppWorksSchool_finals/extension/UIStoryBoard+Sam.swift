//
//  UIStoryBoard+Sam.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

extension UIStoryboard {

    static func mainStoryboard() -> UIStoryboard {

        return UIStoryboard(name: "Main", bundle: nil)
    }

    static func mainPageStoryboard() -> UIStoryboard {

        return UIStoryboard(name: "MainPage", bundle: nil)
    }

    static func orderListStoryboard() -> UIStoryboard {

        return UIStoryboard(name: "OrderList", bundle: nil)
    }

    static func orderDetailStoryboard() -> UIStoryboard {

        return UIStoryboard(name: "OrderDetail", bundle: nil)
    }
}
