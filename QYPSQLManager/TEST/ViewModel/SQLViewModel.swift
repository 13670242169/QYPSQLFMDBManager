//
//  SQLViewModel.swift
//  QYPSQLManager
//
//  Created by Apple on 2017/11/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class SQLViewModel: NSObject {
    var arr = [Person]()
    var p:Person?
    func selectAllData(completion:(_ isSuccess:Bool)->()){
        guard let dicArr = p?.selectData(whereStr: "id < 100") else{
            completion(false)
            return
        }
        var temparr = [Person]()
        for dic in dicArr {
            let p = Person()
            p.name = dic["name"] as? String
            p.sex = dic["sex"] as? String
            p.height = dic["height"] as? String
            p.other = dic["other"] as? String
            temparr.append(p)
        }
        arr = temparr
        if temparr.count > 0 {
            completion(true)
        }


    }

    func selectAllData10(completion:(_ isSuccess:Bool)->()){
        guard let dicArr = p?.selectData(whereStr: "id < 10") else{
            completion(false)
            return
        }
        var temparr = [Person]()
        for dic in dicArr {
            let p = Person()
            p.name = dic["name"] as? String
            p.sex = dic["sex"] as? String
            p.height = dic["height"] as? String
            p.other = dic["other"] as? String
            temparr.append(p)
        }
        arr = temparr
        if temparr.count > 0 {
            completion(true)
        }


    }
}
