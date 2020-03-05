//
//  Utils.swift
//  Tracker
//
//  Created by Кирилл Чулков on 04.03.2020.
//  Copyright © 2020 Кирилл Чулков. All rights reserved.
//

import SwiftUI
import CoreData

extension Task {
    static func create(subject: Subject, time: Date, title: String, content: String, in managedObjectContext: NSManagedObjectContext){
        let newTask = self.init(context: managedObjectContext)
        newTask.id = UUID()
        newTask.time = time
        newTask.title = title
        newTask.descript = content
        newTask.subject = subject
        
        do {
            try  managedObjectContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

extension Collection where Element == Task, Index == Int {
    func delete(at indices: IndexSet, from managedObjectContext: NSManagedObjectContext) {
        indices.forEach { managedObjectContext.delete(self[$0]) }
        
        do {
            try managedObjectContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
}

func cmp(lhs: String, rhs: String) -> Bool {
    let d0 = lhs.firstIndex(of: ":")!
    let h0 = Int(lhs.prefix(upTo: d0))
    let m0 = Int(lhs.suffix(from: d0).dropFirst())
    let d1 = rhs.firstIndex(of: ":")!
    let h1 = Int(rhs.prefix(upTo: d1))
    let m1 = Int(rhs.suffix(from: d1).dropFirst())
    return (h0! < h1!) || (h0 == h1 && m0! < m1!)
}
