//
//  ViewController.swift
//  CoreData_Use
//
//  Created by qwer on 2016/12/19.
//  Copyright © 2016年 qwer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

        let model = MessageModel()
        model.age = 10
        model.name = "PKMessage"
        model.sex = "Boy"
        
        DBManager.insertMessage(model: model)
        
        let personArr:[Person] = DBManager.findMessage(model: model)
        
        for p in personArr {
            
            print(p.name ?? "Hi xiaoWang")
            
        }
        
        let newModel = MessageModel()
        newModel.age = 121
        newModel.name = "上海"
        newModel.sex = "男"
        
        DBManager.uploadMessage(name: "PKMessage", model: newModel)
        
        let tModel = MessageModel()
        tModel.age = 414
        tModel.name = "北京"
        tModel.sex = "男"
        
        DBManager.insertMessage(model: tModel)
        
        DBManager.deleteMessage(model: tModel)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

