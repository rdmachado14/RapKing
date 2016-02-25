//
//  RKTelaInicialViewController.swift
//  RapKing
//
//  Created by leonardo fernandes farias on 25/02/16.
//  Copyright © 2016 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit

class RKTelaInicialViewController: UIViewController, UIDocumentInteractionControllerDelegate {

    @IBOutlet weak var myTable: UITableView!
    var documentController : UIDocumentInteractionController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTable.tableFooterView = UIView(frame: CGRectZero)
        // Do any additional setup after loading the view.
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

}
    



extension RKTelaInicialViewController : UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! RKCutomCell
        cell.lbRima.text = "Meu rap é foda!!!!"
        cell.ivImage.image = UIImage(named: "with-marca-3 4")
        return cell
    }
    
    
}

extension RKTelaInicialViewController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath)
        myTable.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}