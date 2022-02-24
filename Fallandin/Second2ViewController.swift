//
//  Second2ViewController.swift
//  Fallandin
//
//  Created by Aleyna IŞIK on 23.02.2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class Second2ViewController: MyController {
    
    
   
    
    @IBOutlet weak var CollectionView_outlet: UICollectionView!{
        didSet{
            CollectionView_outlet.dataSource = self
            CollectionView_outlet.delegate = self
            CollectionView_outlet.collectionViewLayout = UICollectionViewFlowLayout()
        }
    }
    
    
    
    @IBOutlet weak var title_label_outlet: UILabel!{
        didSet{
            title_label_outlet.text = "Kahve Falı"
        }
    }
    
    @IBOutlet weak var Search_textfield_outlet: UITextField!{
        didSet{
            Search_textfield_outlet.placeholder = "Arama Yapın"
        }
    }
    
    @IBOutlet weak var search_button_outlet: button_desing!{
        didSet{
            search_button_outlet.setTitle("Ara", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func back_button_action(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func home_button_action(_ sender: Any) {
        showVC(identifierName: "FirstViewController")
        }
    
    @IBAction func settings_button_action(_ sender: Any) {
        showVC(identifierName: "SettingsViewController")
        }
    }


extension Second2ViewController{
    
   
    func falci_post_request_json(id : String){
        
        let parameters : Parameters = [
            "falci_id" : id
        ]
        
        let url = apiURL + "/getFalci"

        Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
            [self]
            response in
            switch response.result {
            case .success(let value):
                
                falci_detay = JSON(value)
                print(falci_detay)
                
                showVC(identifierName: "FortuneTellerDetailViewController")

               
                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }

}

extension Second2ViewController : UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return falcilar["data"].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CollectionView_outlet.dequeueReusableCell(withReuseIdentifier: "Second2CollectionViewCell", for: indexPath) as! Second2CollectionViewCell
        
        Url_To_Image(url: imageBaseURL + falcilar["data"][indexPath.item]["falci_img"].stringValue , imageView: cell.profile_picture_Imageview_outlet)
        
        cell.profile_picture_Imageview_outlet.makeRounded()
        
        cell.falci_adi_label_outlet.text = falcilar["data"][indexPath.item]["falci_name"].stringValue
        
        cell.falci_puani_label_outlet.text = falcilar["data"][indexPath.item]["rating"].stringValue
        
        cell.falci_kredisi_label_outlet.text = "Kredi: " + falcilar["data"][indexPath.item]["kredi"].stringValue
        cell.fal_baktir_button_outlet.setTitle("Fal Baktır", for: .normal)
     
        if falcilar["data"][indexPath.item]["is_sesli_fal"].boolValue == true
        {
            cell.sesli_fal_imageview_outlet.isHidden = false
        }else{
            cell.sesli_fal_imageview_outlet.isHidden = true
        }
        
        if falcilar["data"][indexPath.item]["oneCikar"].boolValue == true && falcilar["data"][indexPath.item]["falci_durumu"].boolValue{
            
            cell.coffee_fortune_telling_view_outlet.layer.borderWidth = 2
            cell.coffee_fortune_telling_view_outlet.layer.borderColor = UIColor.systemPink.cgColor
            cell.falci_etiketi_label_outlet.text = "#" + falcilar["data"][indexPath.item]["etiket"].stringValue
        }else{
            
            cell.coffee_fortune_telling_view_outlet.layer.borderWidth = 0
            cell.falci_etiketi_label_outlet.text = falcilar["data"][indexPath.item]["etiket"].stringValue
        }
        
        if falcilar["data"][indexPath.item]["falci_durumu"].boolValue == true{
            
        }
        
        return cell
    }
    
}
extension Second2ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200)
    }
}
