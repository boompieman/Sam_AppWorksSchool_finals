//
//  TimeFormatter.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation

class OLTimeFormatter {

    let dateFormatter: DateFormatter

    init(dateFormat: String = "yyyy-HH-dd HH:mm:ss") {

        self.dateFormatter = DateFormatter()

        self.dateFormatter.dateFormat = dateFormat
    }

    func dateWithUnitTime(time: Double) -> String {

        let date = Date(timeIntervalSince1970: time)

        return dateFormatter.string(from: date)
    }
}
