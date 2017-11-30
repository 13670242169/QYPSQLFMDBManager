//
//  QYPObject+Extension.swift
//  QYPSQLManager
//
//  Created by 瞿源鹏 on 2017/11/29.
//  Copyright © 2017年 瞿源鹏. All rights reserved.
//  qq:980471259

import Foundation
extension NSObject{
    /// 创建数据表
    func createTable(arr:[String]) {
        var sql = "create table if not exists \(self.classForCoder) (id integer primary key autoincrement"
        for str in arr {
            sql += ",\(str) text"
        }
        sql += ");"
        // 2. 执行 SQL - FMDB 的内部队列，串行队列，同步执行
        // 可以保证同一时间，只有一个任务操作数据库，从而保证数据库的读写安全！
        QYPSQLiteManager.shared.queue.inDatabase { (db) in
            // 只有在创表的时候，使用执行多条语句，可以一次创建多个数据表
            // 在执行增删改的时候，一定不要使用 statements 方法，否则有可能会被注入！
            if db.executeStatements(sql) == true {
                print("创表成功")
            } else {
                print("创表失败")
            }
        }
    }
    /// 查询数据表是否存在
    func tableViewIsExists() -> Bool{
        let isTableOkSql = "select count(*) as 'count' from sqlite_master where type ='table' and name = '\(self.classForCoder)';"
        var tempCount:Int64 = 0
        // 判断表是否已经存在
        QYPSQLiteManager.shared.queue.inDatabase { (db) in
            guard let rs = db.executeQuery(isTableOkSql, withArgumentsIn: []) else {
                return
            }
            while rs.next() {
                tempCount = Int64(rs.int(forColumn: "count"))
            }
        }
        if tempCount == 0{
            return false
        }
        return true

    }
    
}
