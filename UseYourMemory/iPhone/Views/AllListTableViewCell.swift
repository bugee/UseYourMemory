//
//  ListTableViewCell.swift
//  UYMS
//
//  Created by Krzysiek on 12.08.2014.
//  Copyright (c) 2014 Enter Point. All rights reserved.
//

import UIKit

class AllListTableViewCell: UITableViewCell {
    
    @IBOutlet var allListCellLabel : UILabel
    
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Initialization code
    }
    
    func setCell(name: String){
        self.allListCellLabel.text = name
//        self.textLabel.text = name
        self.allListCellLabel.textColor = UIColor.redColor()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
