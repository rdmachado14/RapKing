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
    var verificador:Bool!
    var getTitle:String!
    var getRap:String!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        verifica()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func actionSave(sender: AnyObject)
    {
        
        Rhyme.save(textfFieldTitle.text!, rap: textViewRap.text!)
        
            
            
    }
    
    func verifica() {
        if verificador.boolValue {
            textfFieldTitle.text = getTitle
            textViewRap.text = getRap
        } else {
            print("novo rap")
        }
            
    }
    
    
    func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    @IBAction func voltar(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}
