//
//  DiscardedFun.swift
//  QYPSQLManager
//
//  Created by Apple on 2017/11/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

import Foundation
/*


 //        // 2.使用FMDatabase
 //        db = FMDatabase(path: path)
 //
 //        // 3.打开数据库
 //        // open()特点: 如果数据库文件不存在就创建一个新的, 如果存在就直接打开
 //        if !db.open()
 //        {
 //            print("打开数据库失败")
 //            return
 //        }

 //        let isTableOkSql = "select count(*) as 'count' from sqlite_master where type ='table' and name = '\(self.classForCoder)';"
 //        guard let rs = try? QYPSQLiteManager.shared.db.executeQuery(isTableOkSql, values: []) else {
 //            return false
 //        }
 //        while rs.next(){
 //            let count = rs.int(forColumn: "count")
 //            print(count)
 //            if count == 0 {
 //                return false
 //            }
 //        }
 //        return true

 /// 判断字段是否跟新(实际场景:在已经提交的一个版本里面迭代更新,如果数据表中字段发生了改变,就需要给数据表添加新的字段,不然数据永远都无法添加新的数据进去,除非删除旧版本,重新安装下载,如果数据表中存放了重要的数据,如果使用这种方法将会造成无法挽回的损失)
 //    func comparisonOldTableNewTable(){
 //        let arr = propertyList()
 //        for str in arr {
 //
 //            let isExists = QYPSQLiteManager.shared.db.columnExists(str, inTableWithName: "\(self.classForCoder)")
 //            if isExists == false{
 //                alterTable(AddColumn: str)
 //            }
 //        }
 //    }
 /// 处理需求改变时,添加新的字段
 //    func alterTable(AddColumn:String){
 //        let sql = "ALTER TABLE '\(self.classForCoder)' ADD \(AddColumn) TEXT"
 //        QYPSQLiteManager.shared.queue.inDatabase { (db) in
 //            let bool = db.executeUpdate(sql, withArgumentsIn: [])
 //            print(bool)
 //        }
 //    }

 */
