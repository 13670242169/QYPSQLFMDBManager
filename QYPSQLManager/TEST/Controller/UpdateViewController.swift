//
//  UpdateViewController.swift
//  QYPSQLManager
//
//  Created by Apple on 2017/11/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    @IBOutlet weak var naem: UILabel!
    @IBOutlet weak var sex: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var other: UILabel!
    @IBOutlet weak var otherNew: UITextField!
    var model:Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        naem.text = model?.name
        sex.text = model?.sex
        height.text = model?.height
        other.text = model?.other


        // Do any additional setup after loading the view.
    }

    @IBAction func queding(_ sender: Any) {
        guard let str = naem.text else {
            return
        }
        model?.other = otherNew.text
        model?.updateData(whereStr: "name='\(str)'")
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
