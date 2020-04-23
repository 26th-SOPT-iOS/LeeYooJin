//
//  ViewController.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/04/23.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {return}
        
        receiveViewController.name = nameTextField.text
        receiveViewController.pass = passTextField.text
        
        self.present(receiveViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = ""
        passTextField.text = ""
        // Do any additional setup after loading the view.
    }


}

