//
//  SettingsTableViewCell.swift
//  Fallandin
//
//  Created by Aleyna IŞIK on 18.02.2022.
//

import UIKit
import  Kingfisher
class SettingsTableViewCell: UITableViewCell {


    
 
    @IBOutlet weak var background_view_outlet: UIView!
    @IBOutlet weak var settings_picture_Imageview_outlet: AnimatedImageView!
    
    @IBOutlet weak var label_outlet: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
