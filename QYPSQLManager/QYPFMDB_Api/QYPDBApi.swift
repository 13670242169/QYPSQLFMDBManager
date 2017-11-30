//
//  QYPDBApi.swift
//  QYPSQLManager
//
//  Created by 瞿源鹏 on 2017/11/30.
//  Copyright © 2017年 瞿源鹏. All rights reserved.
//  增删改查对应的方法

import Foundation
extension NSObject {
    /// 插入数据
    func insertData(){
        var insertSql = "insert into \(self.classForCoder)"
        let arr = self.propertyList()
        var key = " ("
        var values = " values("
        for str in arr {
            key += "\(str),"
            values += "?,"
        }
        key.remove(at:key.index(before: key.endIndex))
        values.remove(at:values.index(before: values.endIndex))
        insertSql += key + ")" + values + ");"
        let valuesArr = self.getValueOfProperty()
        QYPSQLiteManager.shared.queue.inTransaction { (db, rollback) in
            // 执行 SQL
            if db.executeUpdate(insertSql, withArgumentsIn: valuesArr) == false {
                // 回滚
                rollback.pointee = true
                print("插入数据失败")
            }else{
                print("插入数据成功")
            }
        }
    }
    /// 删除数据
    ///
    /// - Parameter deletStr: "name = 'jacob'"
    func delete(deletStr:String){
        let deleteSql = "delete from \(self.classForCoder) where \(deletStr);"
        print(deleteSql)
        QYPSQLiteManager.shared.queue.inDatabase { (db) in
            if db.executeUpdate(deleteSql, withArgumentsIn: []) == true {
                print("\(self.classForCoder)表删除了\(db.changes)条记录")

            }else {
                print("\(self.classForCoder)表数据操作失败")
            }
        }
    }
    /// 跟新语句全部模型里面的数据全部跟新
    func updateData(whereStr:String){
        /// 定义的属性
        var updateSql = "UPDATE \(self.classForCoder) SET"
        /// 获取到的模型的属性名
        let columnArr = self.propertyList()
        /// 获取到的模型的属性值
        let valueArr = self.getValueOfProperty()
        for i in 0..<columnArr.count {
            updateSql += " \(columnArr[i]) = '\(valueArr[i])',"
        }
        updateSql.remove(at:updateSql.index(before: updateSql.endIndex))
        updateSql += " WHERE \(whereStr);"
        print(updateSql)
        QYPSQLiteManager.shared.queue.inDatabase { (db) in
            if db.executeUpdate(updateSql, withArgumentsIn: []) == true {
                print("\(self.classForCoder)改变了\(db.changes)条记录")
            }else {
                print("\(self.classForCoder)表数据操作失败")
            }
        }
    }
    /// 表中数据全部查出默认按升序排列
    // FIXME:先放在这里,还未处理的是 ORDER BY id DESC 别的东西,现在只做到了id的降序排列
    func selectData(whereStr:String,ORDER_BY:String = "id ASC") -> [[String:AnyObject]]{
        var selectSql = "SELECT id,"
        let columnArr = self.propertyList()
        for str in columnArr {
            selectSql += " \(str),"
        }
        selectSql.remove(at:selectSql.index(before: selectSql.endIndex))

        selectSql += " FROM \(self.classForCoder) WHERE \(whereStr) ORDER BY \(ORDER_BY);"
        print(selectSql)
        var result = [[String: AnyObject]]()
        QYPSQLiteManager.shared.queue.inDatabase { (db) in
            guard let rs = db.executeQuery(selectSql, withArgumentsIn: []) else {
                return
            }
            while rs.next() {
                // FIXME:这里还想到好的办法将其以模型数组的形式return
                // 这里先以字典数组的形式返回回去吧!
                //                let myClass = self.classForCoder
                // 列数
                var dic = [String:AnyObject]()
                let colCount = rs.columnCount
                for col in 0..<colCount {
                    guard let name = rs.columnName(for: col),
                        let value = rs.object(forColumnIndex: col) else {
                            continue
                    }
                    // 在这里通过运行时给类添加属性,并且设置属性值
                    dic[name] = value as AnyObject
                }
                result.append(dic)
            }
        }
        return result
    }
}
