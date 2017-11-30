//
//  QYPObject+Extension.swift
//  QYPSQLManager
//
//  Created by 瞿源鹏 on 2017/11/29.
//  Copyright © 2017年 瞿源鹏. All rights reserved.
//  qq:980471259

import Foundation
import FMDB
class QYPSQLiteManager{
    static let shared = QYPSQLiteManager()
    var db = FMDatabase()
    var queue = FMDatabaseQueue()
    init() {
        let dbName = "status.db"
        var path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        path = (path as NSString).appendingPathComponent(dbName)
        print("数据库的路径 " + path)
        // 1 .使用FMDatabaseQueue
        queue = FMDatabaseQueue(path: path)
    }
    
}

