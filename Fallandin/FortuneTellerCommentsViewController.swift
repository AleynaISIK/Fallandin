//
//  FortuneTellerCommentsViewController.swift
//  Fallandin
//
//  Created by Aleyna IŞIK on 18.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class FortuneTellerCommentsViewController: MyController {

    @IBOutlet weak var title_label_outlet: UILabel!{
        didSet{
            title_label_outlet.text = "Yorumlar"
        }
    }
    
    @IBOutlet weak var tableview_outlet: UITableView!
    {
        didSet{
            tableview_outlet.dataSource = self
            tableview_outlet.delegate = self
            tableview_outlet.rowHeight = 110
            tableview_outlet.backgroundColor = .clear
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yorumcular_post_request_json(falci_id: falci_detay["data"]["falci_id"].stringValue)
//      yorumcular_post_request_json()
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
}

extension FortuneTellerCommentsViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return falci_yorum["data"].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableview_outlet.dequeueReusableCell(withIdentifier: "FortuneTellerCommentsTableViewCell", for: indexPath) as! FortuneTellerCommentsTableViewCell
        
        cell.backgroundColor = .clear
        
        if falci_yorum["data"][indexPath.item]["rating"].stringValue == "1"{
            cell.yildiz2_Imageview_outlet.isHidden = true
            cell.yildiz3_Imageview_outlet.isHidden = true
            cell.yildiz4_Imageview_outlet.isHidden = true
            cell.yildiz5_Imageview_outlet.isHidden = true
        }else  if falci_yorum["data"][indexPath.item]["rating"].stringValue == "2"{
            cell.yildiz3_Imageview_outlet.isHidden = true
            cell.yildiz4_Imageview_outlet.isHidden = true
            cell.yildiz5_Imageview_outlet.isHidden = true
        }else  if falci_yorum["data"][indexPath.item]["rating"].stringValue == "3"{
            
            cell.yildiz4_Imageview_outlet.isHidden = true
            cell.yildiz5_Imageview_outlet.isHidden = true
        }else  if falci_yorum["data"][indexPath.item]["rating"].stringValue == "4"{
            cell.yildiz5_Imageview_outlet.isHidden = true
        }else  if falci_yorum["data"][indexPath.item]["rating"].stringValue == "5"{
            
        }else {
            print("Hata!!")
        }
        
        
        cell.background_view_outlet.layer.borderColor = Color._0A6B77.cgColor
        cell.background_view_outlet.layer.borderWidth = 1
        cell.background_view_outlet.layer.cornerRadius = 12
        
        cell.yorum_label_outlet.text = falci_yorum["data"][indexPath.item]["comment"].stringValue.htmlToString
        
        cell.tarih_label_outlet.text = falci_yorum["data"][indexPath.item]["yorum_tarih"].stringValue
        

        
        return cell
    }
    
}

extension FortuneTellerCommentsViewController{
    
    func yorumcular_post_request_json(falci_id :String){
         
         let parameters : Parameters = [
            "falci_id" : falci_id,
             "start" : "0",
             "end" : "10"
         ]
         
         let url = apiURL + "/getFalciYorum"

         Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
             [self]
             response in
             switch response.result {
             case .success(let value):
                 
                 falci_yorum = JSON(value)
                 print(falci_yorum)
                 tableview_outlet.reloadData()
                 
//                 showVC(identifierName: "ThirdViewController")

                
                 
             case .failure(let error):
                 Swift.print(error)
             }
         }
     }
}
