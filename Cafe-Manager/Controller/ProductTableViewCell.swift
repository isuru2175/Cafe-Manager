//
//  ProductTableViewCell.swift
//  Cafe-Manager
//
//  Created by isuru on 4/28/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var descriptions: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var sell: UISwitch!
    var didValueChanged : ((Bool)->Void)!
    override func awakeFromNib() {
        super.awakeFromNib()
        sell.addTarget(self, action: #selector(onSellValueChanged(sender:)), for: .valueChanged)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func onSellValueChanged(sender:UISwitch){
        didValueChanged(sender.isOn)
    }

}
