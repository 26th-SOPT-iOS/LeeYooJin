//
//  LoginViewController.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/04/23.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    var name: String?
    var pass: String?
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    
    @IBAction func logoutButton(_ sender: Any) {
          self.dismiss(animated: true, completion: nil)
    }
    
    private func setLabels(){
           guard let name = self.name else { return }
           guard let pass = self.pass else { return }
           
           //nameTextField.text = name
           //passTextField.text = pass
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.isNavigationBarHidden = true
        setLabels()
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
