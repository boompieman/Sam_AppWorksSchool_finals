//
//  ItemProvider.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation


struct ItemProvider {

    private let firebaseClient = OLFireBase()

    private let parser = OLJsonParser()

    func getItemsFromFireBase(success: @escaping ([Item]) -> Void) {

        firebaseClient.child("items").observeSingleEvent(of: .value, with: { (snapshot) in

            guard let value = snapshot.value as? [AnyObject] else {
                print("null")
                return
            }

            success(self.parser.parseToItems(value: value))

        })
    }
}
