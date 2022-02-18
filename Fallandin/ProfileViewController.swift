//
//  ProfileViewController.swift
//  Fallandin
//
//  Created by Aleyna IŞIK on 18.02.2022.
//

import UIKit
import SwiftyJSON
import Alamofire

class ProfileViewController: MyController {
    
    
    
    @IBOutlet weak var title_label_outlet: UILabel!{
        didSet{
            title_label_outlet.text = "Profil"
        }
    }
    
    @IBOutlet weak var eposta_label_outlet: UILabel!
    
    @IBOutlet weak var sifreicerik_label_outlet: UILabel!
    
    @IBOutlet weak var ad_icerik_label_outlet: UILabel!
    
    @IBOutlet weak var soyad_icerik_label_outlet: UILabel!
    
    @IBOutlet weak var dogum_icerik_label_outlet: UILabel!
    
    @IBOutlet weak var cinsiyet_icerik_label_outlet: UILabel!
    
    @IBOutlet weak var iliski_icerik_label_outlet: UILabel!
    
    @IBOutlet weak var calisma_icerik_label_outlet: UILabel!
    
    @IBOutlet weak var profile_picture_change_button_outlet: UIButton!{
        didSet{
            profile_picture_change_button_outlet.setTitle("Fotoğrafı Değiştir", for: .normal)
        }
    }
    
    @IBOutlet weak var posta_label_outlet: UILabel!{
        didSet{
            posta_label_outlet.text =  "E-Posta Adresi"
        }
    }
    @IBOutlet weak var HesapBilgileriDuzenle_label_outlet: UILabel!{
        didSet{
            HesapBilgileriDuzenle_label_outlet.text =  "Hesap Bilgilerini Düzenle"
        }
    }
    @IBOutlet weak var sifre_label_outlet: UILabel!{
        didSet{
            sifre_label_outlet.text =  "Şifre"
        }
    }
    @IBOutlet weak var Profil_bilgileri_label_outlet: UILabel!{
        didSet{
            Profil_bilgileri_label_outlet.text =  "Profil Bilgileri Düzenle"
        }
    }
    @IBOutlet weak var ad_label_outlet: UILabel!{
        didSet{
            ad_label_outlet.text =  "Adınız"
        }
    }
    @IBOutlet weak var Soyadiniz_label_outlet: UILabel!{
        didSet{
            Soyadiniz_label_outlet.text =  "Soyadınız"
        }
    }
    @IBOutlet weak var dogum_label_outlet: UILabel!{
        didSet{
            dogum_label_outlet.text =  "Doğum Tarihiniz"
        }
    }
    @IBOutlet weak var cinsiyet_label_outlet: UILabel!{
        didSet{
            cinsiyet_label_outlet.text =  "Cinsiyet"
        }
    }
    @IBOutlet weak var iliski_label_outlet: UILabel!{
        didSet{
            iliski_label_outlet.text =  "İlişki Durumu"
        }
    }
    @IBOutlet weak var calisma_label_outlet: UILabel!{
        didSet{
            calisma_label_outlet.text =  "Çalışma Durumu"
        }
    }
    
    @IBOutlet weak var kaydet_button_outlet: UIButton!{
        didSet{
            kaydet_button_outlet.setTitle("Kaydet", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username_post_request_json(id: user_id)
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

extension ProfileViewController{
    
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

                

                eposta_label_outlet.text = profil_adi["data"]["email"].stringValue
                eposta_label_outlet.addLine(position: .bottom, color: UIColor.black, width: 1)
                
                sifreicerik_label_outlet.text = profil_adi["data"]["password"].stringValue
                sifreicerik_label_outlet.addLine(position: .bottom, color: UIColor.black, width: 1)
                
                ad_icerik_label_outlet.text = profil_adi["data"]["name"].stringValue
                ad_icerik_label_outlet.addLine(position: .bottom, color: UIColor.gray, width: 1)
                
                soyad_icerik_label_outlet.text = profil_adi["data"]["name"].stringValue
                soyad_icerik_label_outlet.addLine(position: .bottom, color: UIColor.gray, width: 1)
                
                dogum_icerik_label_outlet.text = profil_adi["data"]["date"].stringValue
                dogum_icerik_label_outlet.addLine(position: .bottom, color: UIColor.gray, width: 1)
                
                cinsiyet_icerik_label_outlet.text = profil_adi["data"]["cinsiyet_text"].stringValue
              
                
                iliski_icerik_label_outlet.text = profil_adi["data"]["iliski_durumu_text"].stringValue
            
                
                calisma_icerik_label_outlet.text = profil_adi["data"]["calisma_durumu_text"].stringValue
                
                
                
                
                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }
    
    
}
