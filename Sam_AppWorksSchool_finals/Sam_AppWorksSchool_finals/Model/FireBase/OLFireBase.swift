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

//    static let shared = OLFireBase()

    func child(_ path: String) -> DatabaseQuery {

        var ref = Database.database().reference()

        ref = ref.child(path)

        return ref
    }
}
