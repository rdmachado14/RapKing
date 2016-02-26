//
//  RKCutomCell.swift
//  RapKing
//
//  Created by leonardo fernandes farias on 25/02/16.
//  Copyright © 2016 Rodrigo DAngelo Silva Machado. All rights reserved.
//

import UIKit

class RKCutomCell: UITableViewCell {

    @IBOutlet weak var lbRima: UILabel!
    @IBOutlet weak var ivImage: UIImageView!
    var pegaIndice:PegaIndice? = nil
    var id:Int? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func edit(sender: AnyObject) {
        let indice = id
        pegaIndice?.pegaIndice(indice!)
    }
    

}
