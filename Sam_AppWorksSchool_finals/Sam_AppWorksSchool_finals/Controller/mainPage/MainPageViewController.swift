//
//  mainPageViewController.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation
import UIKit

class MainPageViewController: UIViewController {

    override func viewDidLoad() {

        OLFireBase.shared.child("items").observeSingleEvent(of: .value) { (snapshot) in
            print(snapshot.key)
        }

    }
}
