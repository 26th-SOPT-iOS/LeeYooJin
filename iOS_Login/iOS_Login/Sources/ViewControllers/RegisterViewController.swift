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
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var registerButton: UIButton!
    
    
    //가입완료 버튼 이벤트 함수
    @IBAction func registerButton(_ sender: Any) {
        guard let inputID = idTextField.text else { return }
        guard let inputPWD = passTextField.text else { return }
        guard let inputNAME = nameTextField.text else { return }
        guard let inputEMAIL = emailTextField.text else { return }
        guard let inputPHONE = phoneTextField.text else { return }
        
        SignupService.shared.signup(id: inputID, pwd: inputPWD, name: inputNAME, email: inputEMAIL, phone: inputPHONE) { networkResult in
            switch networkResult {
            case .success:
                guard let signinController = self.storyboard?.instantiateViewController(identifier: "SigninViewController") as? ViewController else { return }
                
                signinController.textID = inputID
                signinController.textPWD = inputPWD
                
                self.dismiss(animated: true, completion: nil)
                self.navigationController?.pushViewController(signinController, animated: true)
                
            case .requestErr(let message):
                guard let message = message as? String else { return }
                let alertViewController = UIAlertController(title: "회원가입 실패", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                               alertViewController.addAction(action)
                               self.present(alertViewController, animated: true, completion: nil)
            case .pathErr: print("path")
            case .serverErr: print("serverErr")
            case .networkFail: print("networkFail")
            }
        }
        
        
       
    }
    
    //textfield 둥글게 placeholder 패딩값 주는 함수
    func setTextField() {
        
        //textfield 라운딩과 왼쪽 패딩값 설정
        nameTextField.layer.cornerRadius = 22
        nameTextField.addLeftPadding()
        emailTextField.layer.cornerRadius = 22
        emailTextField.addLeftPadding()
        passTextField.layer.cornerRadius = 22
        passTextField.addLeftPadding()
        passTextField.isSecureTextEntry = true
        idTextField.layer.cornerRadius = 22
        idTextField.addLeftPadding()
        phoneTextField.layer.cornerRadius = 22
        phoneTextField.addLeftPadding()
        
        //가입완료 버튼
        registerButton.layer.cornerRadius = 22
    }
    
    //네비게이션바 설정 함수(투명하게)
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
        // Do any additional setup after loading the view.
    }
    
}
