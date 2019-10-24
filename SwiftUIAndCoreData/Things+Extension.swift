//
//  Things+Extension.swift
//  SwiftUIAndCoreData
//
//  Created by Raphael Berendes (extern) on 24.10.19.
//  Copyright © 2019 Raphael Berendes (extern). All rights reserved.
//

import CoreData
import UIKit

extension Things: Identifiable {}

extension Things {
    
    static func allIdeasFetchRequest() -> NSFetchRequest<Things> {
        
        let request: NSFetchRequest<Things> = Things.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: NSExpression(forKeyPath: \Things.name).keyPath, ascending: true)]
          
        return request
    }
    
    static func saveRandomThing() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let viewContext = appDelegate.persistentContainer.viewContext
        
        let thingy = Things(entity: Things.entity(), insertInto: viewContext)
        thingy.id = Int64.random(in: 0...Int64.max)
        thingy.name = UUID().description
        
        appDelegate.saveContext()
    }
    
    static func deleteAll() {
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let viewContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<Things> = Things.fetchRequest()
        
        do {
            let result = try viewContext.fetch(fetchRequest)
            for object in result {
                viewContext.delete(object)
            }
            appDelegate.saveContext()
        } catch {
            fatalError("Failed to perform batch update: \(error)")
        }
    }

}
