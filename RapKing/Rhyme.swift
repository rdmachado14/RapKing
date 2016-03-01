//
//  Rhyme.swift
//  RapKing
//
//  Created by leonardo fernandes farias on 25/02/16.
//  Copyright © 2016 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class Rhyme: NSManagedObject {

    
// Insert code here to add functionality to your managed object subclass

    static func list(entity: String) -> [AnyObject]? {
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        let requestFetch = NSFetchRequest(entityName: entity)
        do {
            
            return try context.executeFetchRequest(requestFetch)
            
        } catch {
            print("Erro na listagem")
            return nil
        }
    }
    
    static func save(title: String, rap: String) {
        
        do{
            // ligação com o delegate
            let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
            let context: NSManagedObjectContext = appDelegate.managedObjectContext
            
            // entidade do banco de dados
            let newRap = NSEntityDescription.insertNewObjectForEntityForName("Rhyme", inManagedObjectContext: context) as NSManagedObject
            
            // atributos da entidade
            newRap.setValue(title, forKey: "title")
            newRap.setValue(rap, forKey: "rap")
            
            try context.save()
            
            print(newRap)
            print("Objetos salvos!")
        }catch{
            
            
        }
        
    }
    
    static func SaveEdit() {
        
        do {
            let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
            let context: NSManagedObjectContext = appDelegate.managedObjectContext
            try context.save()
            
            print("Edicao salvos!")
        } catch {
            print("erro")
        }
    }
    
}
