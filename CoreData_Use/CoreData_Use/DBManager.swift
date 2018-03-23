//
//  DBManager.swift
//  CoreData_Use
//
//  Created by qwer on 2016/12/19.
//  Copyright © 2016年 qwer. All rights reserved.
//

import UIKit

class DBManager: NSObject {

    //增：
    static func insertMessage(model:MessageModel){
        
       let person = Person.mr_createEntity()

        person?.age = model.age
        person?.name = model.name
        person?.sex = model.sex
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
        
    }
    
    //查：
    static func findMessage(model:MessageModel)->[Person]{
        
//        let personArray:[Person] = Person.mr_findAll() as! [Person] //查找所有的人
//        let personSorted:[Person] = Person.mr_findAllSorted(by: "age", ascending: true) as! [Person]  //查找所有的人 按age排序
        let personAge:[Person] = Person.mr_find(byAttribute: "age", withValue: NSNumber.init(value: model.age)) as! [Person] //查找所有age=model.age的人
        
//        print(personAge)
//        
//        
//        print(personSorted)

        
//        print(personArray)
        
//        let firstPerson = Person.mr_findFirst()
//        print(firstPerson?.age ?? 10,firstPerson?.name ?? "Hello")
        
        return personAge
        
    }
    
    //改：
    static func uploadMessage(name:String,model:MessageModel){
        
        let personArray:[Person] = Person .mr_find(byAttribute: "name", withValue: name) as! [Person]
        for pe:Person in personArray {
            
            pe.name = model.name
            pe.age = model.age
            pe.sex = model.sex
            
        }
        
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
        
    }
    
    //删：
    static func deleteMessage(model:MessageModel){
        
        let personArray:[Person] = Person .mr_find(byAttribute: "name", withValue: model.name) as! [Person]
        for p in personArray {
            p.mr_deleteEntity()
        }
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
        
    }
    
    
}
