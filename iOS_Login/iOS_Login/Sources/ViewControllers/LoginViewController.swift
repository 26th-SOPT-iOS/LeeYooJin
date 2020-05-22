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
    
    @IBAction func logoutButton(_ sender: Any) {
        autoLogout()
    }

    func autoLogout(){
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "pw")

        self.dismiss(animated: true, completion: nil)
        
    }
    
    func setNavi(){
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //setLabels()
        setNavi()
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
