//
//  OLFireBase.swift
//  Sam_AppWorksSchool_finals
//
//  Created by MACBOOK on 2018/6/18.
//  Copyright © 2018年 MACBOOK. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class OLFireBase {

    static let shared = OLFireBase()

    private var ref = Database.database().reference()

    func child(_ path: String) -> DatabaseQuery {

        ref = ref.child(path)

        return ref
    }
}
