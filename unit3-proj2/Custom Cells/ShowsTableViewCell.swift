//
//  ShowsTableViewCell.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 9/12/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class ShowsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var showTitleLabel: UILabel!
    @IBOutlet weak var showImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
