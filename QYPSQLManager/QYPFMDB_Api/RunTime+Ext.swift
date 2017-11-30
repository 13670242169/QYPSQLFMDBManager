//
//  RunTime+Ext.swift
//  QYPSQLManager
//
//  Created by 瞿源鹏 on 2017/11/30.
//  Copyright © 2017年 瞿源鹏. All rights reserved.
//  这个类用来获取对应的实体模型的属性

import Foundation
extension NSObject{
    /// 通过字典设置属性值
    ///
    /// - Parameter dic: [属性名:属性值]
    /// - Returns: 是否设置成功
    func setValueOfProperty(dic:[String:String])->Bool{
        let allPropertys = self.propertyList()
        for key in allPropertys {
            self.setValue(dic[key], forKey: key)
        }
        return true
    }
    /// 获取属性值
    ///
    /// - Returns: 返回获取到的属性值数组
    func getValueOfProperty()->[String]{
        let allPropertys = self.propertyList()
        var values = [String]()
        for key in allPropertys {
            let val = self.value(forKey: key) as? String ?? ""
            values.append(val)
        }
        return values
    }
    ///[使用运行时]获取当前类所有的属性数组
    func propertyList() -> [String] {
        var count :UInt32 = 0
        //获取‘类’的属性列表
        guard let list = class_copyPropertyList(self.classForCoder, &count) else{
            return []
        }
        var arr = [String]()
        for i in 0..<Int(count) {
            //根据下标 获取属性
            let a = list[i]
            //获取属性的名称
            let cName = property_getName(a)
            let n = String(utf8String:cName)
            arr.append(n ?? "")
        }
        // 在这个方法里面创建数据表.
        if tableViewIsExists() == false{
            createTable(arr: arr)
        }

        return arr
    }
}
