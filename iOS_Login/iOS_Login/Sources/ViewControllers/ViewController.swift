//
//  ViewController.swift
//  iOS_Login
//
//  Created by 이유진 on 2020/04/23.
//  Copyright © 2020 이유진. All rights reserved.
//

import UIKit
import BEMCheckBox

class ViewController: UIViewController {

    var textID: String? = ""
    var textPWD: String? = ""
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var autoCheckBox: BEMCheckBox!
    
   
    @IBAction func autoLogin(_ sender: BEMCheckBox) {
        if autoCheckBox.on == true {
            print("Auto Login")
            // 자동 로그인 선택 시 로그인 하면서 uid, pwd 저장
            UserDefaults.standard.set(self.idTextField.text, forKey: "id")
            UserDefaults.standard.set(self.passTextField.text, forKey: "pw")
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passTextField.text else { return }
       
        
        login(inputID,inputPWD)
        
}
    
    func login(_ inputID: String, _ inputPWD: String) {    
        LoginService.shared.login(id: inputID, pwd: inputPWD) { networkResult in
            switch networkResult {
            case .success(let token):
                guard let token = token as? String else { return }
                UserDefaults.standard.set(token, forKey: "token")
                guard let tabbarController = self.storyboard?.instantiateViewController(identifier: "customTabbarController") as? UITabBarController else { return }
                tabbarController.modalPresentationStyle = .fullScreen

                self.present(tabbarController, animated: true, completion: nil)
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "로그인 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                alertViewController.addAction(action)
                self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")

            }
        }
    }
    
    func setTextField() {
        idTextField.addLeftPadding()
        passTextField.addLeftPadding()
        idTextField.layer.cornerRadius = 22
        passTextField.layer.cornerRadius = 22
        loginButton.layer.cornerRadius = 22
        passTextField.isSecureTextEntry = true
    }
    
    func setNavi(){
           //네비게이션 바를 투명하게
           //self.navigationController?.navigationBar.topItem?.title = ""
           self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
           self.navigationController?.navigationBar.shadowImage = UIImage()
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
        setNavi()
        idTextField.text = textID
        passTextField.text = textPWD
        
        //회원가입 후 자동로그인
        if idTextField.text != ""{
            login(self.idTextField.text!, self.passTextField.text!)
        }
        
        //자동로그인 설정
        if let userID = UserDefaults.standard.string(forKey: "id"){
            let userPWD = UserDefaults.standard.string(forKey: "pw")
            login(userID, userPWD!)
        }
        
    }


}

extension UITextField {
    //TextField 패딩값 주기
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

