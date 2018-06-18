//
//  SelectGuitarTypeCell.swift
//  LuthierShop
//
//  Created by Yeltsin Suares Lobato Gama on 18/06/18.
//  Copyright © 2018 Yeltsin Suares Lobato Gama. All rights reserved.
//

import UIKit

class SelectGuitarTypeCell: UITableViewCell {
    
    @IBOutlet weak var labelGuitarType: UILabel!
    @IBOutlet weak var guitarBodyTypeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
