//
//  SettingsViewController.swift
//  Fallandin
//
//  Created by Aleyna IŞIK on 18.02.2022.
//

import UIKit
import Kingfisher
import Alamofire
import SwiftyJSON

class SettingsViewController: MyController {
    
    @IBOutlet weak var title_label_outlet: UILabel!{
        didSet{
            title_label_outlet.text = "Ayarlar"
        }
    }
    
    @IBOutlet weak var tableview_outlet: UITableView!{
        didSet{
            tableview_outlet.dataSource = self
            tableview_outlet.delegate = self
            tableview_outlet.rowHeight = 90
            tableview_outlet.backgroundColor = .clear
            
        }
    }
   
    @IBOutlet weak var sign_out_button_outlet: UIButton!{
        didSet{
            sign_out_button_outlet.setTitle("Çıkış Yap", for: .normal)
            sign_out_button_outlet.backgroundColor = UIColor.systemRed
            sign_out_button_outlet.layer.cornerRadius = 12
        }
    }
    
    @IBOutlet weak var profile_imageview_outlet: AnimatedImageView!{
        didSet{
            profile_imageview_outlet.makeRounded()
        }
    }
    
    @IBOutlet weak var user_name_label_outlet: UILabel!{
        didSet{
            
            user_name_label_outlet.text = ""
            
        }
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings_post_request_json()
        username_post_request_json(id: user_id)

    }
    
    
    @IBAction func back_button_action(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func home_button_action(_ sender: Any) {
        showVC(identifierName: "FirstViewController")
        }

    @IBAction func setting_profile_button_action(_ sender: Any) {
        showVC(identifierName: "ProfileViewController")
    }
    
}

extension SettingsViewController :UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview_outlet.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        
        cell.backgroundColor = .clear
        
        cell.background_view_outlet.layer.cornerRadius = 12
        cell.background_view_outlet.backgroundColor = UIColor.white
        
        
        cell.label_outlet.text = keyword["setting_page"]["settings"][indexPath.item]["text"].stringValue
        
        return cell
    }
}

extension SettingsViewController{
    
   
    func settings_post_request_json(){
        
        let parameters : Parameters = [:
            
            
        ]
        
        let url = apiURL + "/keywords"

        Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
            [self]
            response in
            switch response.result {
            case .success(let value):
                
                keyword = JSON(value)
                tableview_outlet.reloadData()
                print(keyword)

                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }
}
extension SettingsViewController{
    func username_post_request_json(id: String){
         
         let parameters : Parameters = [
            "user_id" : id
           
         ]
         
         let url = apiURL + "/getProfil"

         Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
             [self]
             response in
             switch response.result {
             case .success(let value):
                 
                 profil_adi = JSON(value)
                 print("settings:\(profil_adi)")
                 user_name_label_outlet.text = profil_adi["data"]["profil_name"].stringValue
                
  
                 
             case .failure(let error):
                 Swift.print(error)
             }
         }
     }


}
