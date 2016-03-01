//
//  RKTelaInicialViewController.swift
//  RapKing
//
//  Created by leonardo fernandes farias on 25/02/16.
//  Copyright © 2016 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit
import CoreData

protocol PegaIndice {
    func pegaIndice(indice:Int)
}

class RKTelaInicialViewController: UIViewController, UIDocumentInteractionControllerDelegate {

    @IBOutlet weak var myTable: UITableView!
    var documentController : UIDocumentInteractionController!
    
    let appDelegate: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
    var resultado = [Rhyme]()
    var id:Int!
    var verificador = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultado = Rhyme.list("Rhyme") as! [Rhyme]!

        myTable.tableFooterView = UIView(frame: CGRectZero)
        print(resultado.count)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        resultado = Rhyme.list("Rhyme") as! [Rhyme]!
        myTable.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "edit" {
            let viewController:RKCreateRapViewController = segue.destinationViewController as! RKCreateRapViewController
            if verificador.boolValue {
                viewController.getObjeto = resultado[id]
            }
            viewController.verificador = verificador
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func actionShare(sender: AnyObject)
    {
        
        print("share")
        
        let writePath = (NSTemporaryDirectory() as NSString).stringByAppendingPathComponent("img.ig")
        let imageData = UIImagePNGRepresentation(UIImage(named: "with-marca-3 4")!)
        
        if imageData?.writeToFile(writePath, atomically: true) == false {
            return
        } else {
            let fileURL = NSURL(fileURLWithPath: writePath)
            
            self.documentController = UIDocumentInteractionController(URL: fileURL)
            self.documentController.delegate = self
            self.documentController.presentOpenInMenuFromRect(self.view.frame, inView: self.view, animated: true)
        }
        
    }
    
    @IBAction func escrever(sender: AnyObject) {
        verificador = false
        performSegueWithIdentifier("edit", sender: self)
    }
    

}
    



extension RKTelaInicialViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultado.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! RKCutomCell
        cell.pegaIndice = self
        cell.id = indexPath.row
        cell.lbRima.text = resultado[indexPath.row].title
        return cell
    }
    
    
}

extension RKTelaInicialViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
        myTable.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

extension RKTelaInicialViewController : PegaIndice {
    func pegaIndice(indice: Int) {
        self.id = indice
        self.verificador = true
        performSegueWithIdentifier("edit", sender: self)
    }
}