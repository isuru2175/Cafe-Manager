//
//  orderTableViewCell.swift
//  Cafe-Manager
//
//  Created by isuru on 4/28/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit

class orderTableViewCell: UITableViewCell {
    @IBOutlet weak var CustomerName: UILabel!
    
    @IBOutlet weak var OrderId: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
