//
//  ViewController.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import UIKit

enum TabBar {

    case mainPage

    case orderList

    func controller() -> UIViewController {

        switch self {

        case .mainPage:

            return UIStoryboard.mainPageStoryboard().instantiateInitialViewController()!

        case .orderList:

            return UIStoryboard.orderListStoryboard().instantiateInitialViewController()!
        }
    }

    func image() -> UIImage {

        switch self {

        case .mainPage:

            return #imageLiteral(resourceName: "shopping-cart")

        case .orderList:

            return #imageLiteral(resourceName: "bulleted-list")
        }
    }

    func selectedImage() -> UIImage {

        switch self {

        case .mainPage:

            return #imageLiteral(resourceName: "shopping-cart").withRenderingMode(.alwaysTemplate)

        case .orderList:

            return #imageLiteral(resourceName: "bulleted-list").withRenderingMode(.alwaysTemplate)
        }
    }
}

class TabBarViewController: UITabBarController {

    var tabs = [TabBar]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tabs = [.mainPage, .orderList]
        // Do any additional setup after loading the view, typically from a nib.

        setupTab()
    }


    private func setupTab() {

        // 避免擋住tableView

//        tabBar.tintColor = UIColor(red: 215/255, green: 68/255, blue: 62/255, alpha: 1.0)

        var controllers: [UIViewController] = []

        for tab in tabs {

            let controller = tab.controller()

            let item = UITabBarItem(
                title: nil,
                image: tab.image(),
                selectedImage: tab.selectedImage()
            )

            item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

            controller.tabBarItem = item

            controllers.append(controller)
        }

        setViewControllers(controllers, animated: false)
    }
}

