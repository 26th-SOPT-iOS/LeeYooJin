//
//  RegisterViewController.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/04/23.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

   
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    @IBAction func registerButton(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return }
              
              receiveViewController.name = nameTextField.text
              receiveViewController.pass = passTextField.text
        self.present(receiveViewController, animated: true)
        self.navigationController?.popViewController(animated: true)
        
        
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()

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
