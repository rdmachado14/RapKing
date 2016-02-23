//
//  RKCreateRapViewController.swift
//  RapKing
//
//  Created by Rodrigo Machado on 2/23/16.
//  Copyright © 2016 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit
import CoreData

class RKCreateRapViewController: UIViewController
{

    @IBOutlet weak var textFieldRapTitle: UITextField!
    @IBOutlet weak var textViewRap: UITextView!
    
    // variável para fazer referência ao Core Data
    var rhymes = [NSManagedObject]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func actionSave(sender: AnyObject)
    {
        // ligando com o app delegate
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        // escolhendo a entidade
        let newRhyme = NSEntityDescription.insertNewObjectForEntityForName("Rhyme", inManagedObjectContext: context) as NSManagedObject
        
        // salvando nos atributos da entidade
        newRhyme.setValue(textFieldRapTitle.text, forKey: "title")
        newRhyme.setValue(textViewRap.text, forKey: "rap")
        
        print(newRhyme)
        print("Objeto salvo!")
    }
    


    
    


}
