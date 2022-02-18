//
//  ViewController.swift
//  Fallandin
//
//  Created by Aleyna IŞIK on 18.02.2022.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: MyController {
    
    
    @IBOutlet weak var sign_in_label_outlet: UILabel!{
        didSet{
            sign_in_label_outlet.text = "Sign in"
        }
    }
    
    @IBOutlet weak var sign_in_content_label_outlet: UILabel!{
        didSet{
            sign_in_content_label_outlet.text = "Please fill in the credentials"
        }
    }
    
    @IBOutlet weak var username_textfield_outlet: UITextField!{
        didSet{
            username_textfield_outlet.placeholder = "Username"
        }
    }
    
    @IBOutlet weak var password_textfield_outlet: UITextField!{
        didSet{
            password_textfield_outlet.placeholder = "Password"
        }
    }
    
    
    
    @IBOutlet weak var sign_in_button_outlet: UIButton!{
        didSet{
            sign_in_button_outlet.setTitle("Sign in", for: .normal)
        }
    }
    
    @IBOutlet weak var sign_up_button_outlet: UIButton!{
        didSet{
            sign_up_button_outlet.setTitle("Don't have an accaount?                                      Sign up", for: .normal)
        }
    }
    @IBOutlet weak var password_forget_button_outlet: UIButton!{
        didSet{
            password_forget_button_outlet.setTitle("I forgot my password", for: .normal)
        }
    }
    
    @IBAction func eye_button_action(_ sender: Any) {
        password_textfield_outlet.isSecureTextEntry.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    @IBAction func sign_up_button_action(_ sender: UIButton) {
        post_request_json(email: String(username_textfield_outlet.text!), sifre: String(password_textfield_outlet.text!))
        
    }
    
    @IBAction func password_forget_button_action(_ sender: UIButton) {
        password_forget_button_outlet.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

    }
    @objc private func showAlert(){
        let alert = UIAlertController(
            title: "Şifremi Unuttum",
            message: "E-Posta Adresiniz",
            preferredStyle: .alert)
        
        alert.addTextField{ field in
            field.placeholder = "E-mail Adres"
            field.returnKeyType = .next
            field.keyboardType = .emailAddress
        }
        
        alert.addAction(UIAlertAction(title: "Gönder", style: .default, handler: { _ in
            
            guard let fields = alert.textFields, fields.count == 1 else {
                print("burası çalışıyor")
                return
            }
            let emailField = fields [0]
            guard let email = emailField.text, !email.isEmpty else{
                self.messageBox(title: "Uyarı", message: "Lütfen Boş Bırakmayın")
                return
                
            }
            
            self.sifre_unutma_post_request(email: String(emailField.text!))
            
        }))
        present(alert, animated: true)
        
    }
    
    
}

extension ViewController{
    
    //ALAMOFIRE JSON
    func post_request_json(email : String, sifre:String){
        
        let parameters : Parameters = [
            "email" : email,
            "pass" : sifre,
            
        ]
        
        let url = apiURL + "/giris"
        
        Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
            [self]
            response in
            switch response.result {
            case .success(let value):
                print(value)
                
                 giris = JSON(value)
                
                if giris["isSuccess"].boolValue == true {
                    
                user_id = giris["data"]["user_id"].stringValue
                  showVC(identifierName: "FirstViewController")
                }
                else {
                    messageBox(title: giris["desc"]["baslik"].stringValue, message: giris["desc"]["mesaj"].stringValue)
                }
                
                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }
    //ALAMOFIRE JSON
    func sifre_unutma_post_request(email : String){
        
        let parameters : Parameters = [
            "email" : email
            
        ]
        
        let url = apiURL + "/sifremiUnuttum"
        
        Alamofire.request(url, method: .post,parameters:parameters, encoding: URLEncoding.httpBody).responseJSON {
            [self]
            response in
            switch response.result {
            case .success(let value):
                print(value)
                
                 sifre = JSON(value)
                
                if sifre["isSuccess"].boolValue == true {
                    messageBox(title: sifre["desc"]["baslik"].stringValue, message: sifre["desc"]["mesaj"].stringValue)
                    
                }
                else {
                    messageBox(title: sifre["desc"]["baslik"].stringValue, message: sifre["desc"]["mesaj"].stringValue)
                }
                
                
            case .failure(let error):
                Swift.print(error)
            }
        }
    }
}
