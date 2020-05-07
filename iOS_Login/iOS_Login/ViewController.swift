//
//  ViewController.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/04/23.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit

extension UITextField {
     func addLeftPadding() {
       let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: self.frame.height))
       self.leftView = paddingView
       self.leftViewMode = ViewMode.always
     }
   }

class ViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    @IBAction func loginButton(_ sender: Any) {
        guard let receiveViewController = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {return}
        
        receiveViewController.name = nameTextField.text
        receiveViewController.pass = passTextField.text
        
       // self.present(receiveViewController, animated: true, completion: nil)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = ""
        nameTextField.addLeftPadding()
        passTextField.text = ""
        passTextField.addLeftPadding()
        nameTextField.layer.cornerRadius = 22
        passTextField.layer.cornerRadius = 22
        loginButton.layer.cornerRadius = 22
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
       
        
        // Do any additional setup after loading the view.
    }


}

