//
//  AppMakeInit.swift
//  CoreData_Use
//
//  Created by qwer on 2016/12/19.
//  Copyright © 2016年 qwer. All rights reserved.
//


import UIKit

class AppMakeInit: NSObject {

    
   static func coreDataInit() {
        
        MagicalRecord.setupCoreDataStack(withStoreNamed: "hpk.sqlite") //设置coreData路径
        
    }
    
    
    
}
