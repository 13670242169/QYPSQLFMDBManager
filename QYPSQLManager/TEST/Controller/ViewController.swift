//
//  ViewController.swift
//  QYPSQLManager
//
//  Created by 瞿源鹏 on 2017/11/29.
//  Copyright © 2017年 瞿源鹏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let vm = SQLViewModel()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    let p = Person()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 为什么要将这个对象传过去呢???应为本封装要通过对应的模型对象有内存地址,已经初始化的对象去映射,去获取对应的属性
        vm.p = p
        vm.selectAllData10{ (isSuccess) in
            if isSuccess == true{
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "QYPTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellID")

    }
    /// 插入一条数据
    @IBAction func insert(_ sender: Any) {
        p.name = "鹏大哥"
        p.height = "180"
        p.sex = "男"
        p.other = "帅气的iOS攻城狮"
        p.insertData()
    }
    /// 插入100条数据
    @IBAction func inset100(_ sender: Any) {
        for i in 0..<100 {
            p.name = "鹏大哥\(i)"
            p.height = "180"
            p.sex = "男"
            p.other = "帅气的iOS攻城狮"
            p.insertData()
        }
    }
    /// 查询100条数据
    @IBAction func selectAlldata(_ sender: Any) {
        vm.p = p
        vm.selectAllData { (isSuccess) in
            if isSuccess == true{
                self.tableView.reloadData()
            }
        }
    }
}
// MARK: - tableView代理方法实现
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! QYPTableViewCell
        cell.p = vm.arr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = vm.arr[indexPath.row]
        let v = UpdateViewController()
        v.model = model
        self.navigationController?.pushViewController(v, animated: true)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let model = vm.arr[indexPath.row]
        guard let name = model.name else{
            return
        }
        model.delete(deletStr: "name='\(name)'")
        vm.arr.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
}

