//
//  RegisterViewController.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/04/23.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

   
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    
    @IBAction func registerButton(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
              
              receiveViewController.name = emailTextField.text
              receiveViewController.pass = passTextField.text
        self.present(receiveViewController, animated: true)
        self.navigationController?.popViewController(animated: true)
        
        
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.layer.cornerRadius = 22
        nameTextField.addLeftPadding()
        emailTextField.layer.cornerRadius = 22
        emailTextField.addLeftPadding()
        passTextField.layer.cornerRadius = 22
        passTextField.addLeftPadding()
        registerButton.layer.cornerRadius = 22
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
