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
    
    @IBOutlet weak var textfFieldTitle: UITextField!
    @IBOutlet weak var textViewRap: UITextView!
    

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
        // ligação com o delegate
        let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDelegate.managedObjectContext
        
        // entidade do banco de dados
        let newRap = NSEntityDescription.insertNewObjectForEntityForName("Rhyme", inManagedObjectContext: context) as NSManagedObject
        
        // atributos da entidade
        newRap.setValue(textfFieldTitle.text, forKey: "title")
        newRap.setValue(textViewRap.text, forKey: "rap")
        
        print(newRap)
        print("Objetos salvos!")
        
    }
    
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func voltar(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
