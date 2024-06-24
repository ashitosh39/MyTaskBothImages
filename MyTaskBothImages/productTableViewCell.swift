//
//  productTableViewCell.swift
//  MyTaskBothImages
//
//  Created by Macintosh on 20/05/24.
//

import UIKit

class productTableViewCell: UITableViewCell {

    @IBOutlet weak var mainProductImageLabel: UIImageView!
    
  
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var pricelabel: UILabel!
    
    @IBOutlet weak var categoryIdLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
