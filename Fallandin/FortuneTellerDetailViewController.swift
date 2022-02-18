//
//  FortuneTellerDetailViewController.swift
//  Fallandin
//
//  Created by Aleyna IŞIK on 18.02.2022.
//

import UIKit
import Kingfisher

class FortuneTellerDetailViewController: MyController {

    @IBOutlet weak var title_label_outlet: UILabel!{
        didSet{
            title_label_outlet.text = falci_detay["data"]["falci_name"].stringValue
        }
    }
    
    @IBOutlet weak var fortune_teller_name_label_outlet: UILabel!{
        didSet{
            fortune_teller_name_label_outlet.text = falci_detay["data"]["falci_name"].stringValue
        }
    }
    
    @IBOutlet weak var imageview_outlet: AnimatedImageView!{
        didSet{
            Url_To_Image(url: imageBaseURL + falci_detay["data"]["falci_img"].stringValue , imageView: imageview_outlet)
            imageview_outlet.makeRounded()
        }
    }
  
    @IBOutlet weak var falcipuan_label_outlet: UILabel!{
        didSet{
            falcipuan_label_outlet.text = falci_detay["data"]["rating"].stringValue
            
        }
    }
    
    @IBOutlet weak var falcietiket_label_outlet: UILabel!{
        didSet{
            falcietiket_label_outlet.text = falci_detay["data"]["etiket"].stringValue
            falcietiket_label_outlet.textColor = UIColor.purple
            
        }
    }
    
    @IBOutlet weak var falcihakkinda_label_outlet: UILabel!{
        didSet{
            falcihakkinda_label_outlet.text = falci_detay["data"]["desc"].stringValue.htmlToString
            
        }
    }
    
    @IBOutlet weak var tumyorumlar_button_outlet: UIButton!{
        didSet{
            tumyorumlar_button_outlet.setTitle("Tüm Yorumlar", for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func back_button_action(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func home_button_action(_ sender: Any) {
        showVC(identifierName: "FirstViewController")
        }
    
    @IBAction func settings_button_action(_ sender: Any) {
        showVC(identifierName: "SettingsViewController")
    }
    
    @IBAction func tumyorumlar_button_action(_ sender: UIButton) {
        showVC(identifierName: "FortuneTellerCommentsViewController")
    }
    
    
}

