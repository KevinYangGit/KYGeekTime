//
//  KYLoginViewController.swift
//  KYGeekTime
//
//  Created by yangqi on 2022/8/26.
//

import UIKit
import SnapKit

protocol ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool
}

protocol ValidatesPasswordNumber {
    func validatePasswordNumber(_ password: String) -> Bool
}

extension ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}

extension ValidatesPasswordNumber {
    func validatePasswordNumber(_ password: String) -> Bool {
        if password.count < 6 || password.count > 11 {
            return false
        }
        return true
     }
}

class KYLoginViewController: KYBaseViewController, ValidatesPhoneNumber, ValidatesPasswordNumber {

    var phoneTextField: UITextField!
    var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupViews()
    }
    
    func setupViews() {
        let logoImageView = UIImageView(image: R.image.logo())
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        phoneTextField = UITextField()
        phoneTextField.leftView = phoneIconView
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTextField.layer.borderWidth = 1
        phoneTextField.textColor = UIColor.hexColor(0x333333)
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.layer.masksToBounds = true
        phoneTextField.placeholder = "请输入手机号"
        view.addSubview(phoneTextField)
        phoneTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        
        let passwordIconView = UIImageView(image: R.image.icon_pwd())
        passwordTextField = UITextField()
        passwordTextField.leftView = passwordIconView
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.textColor = UIColor.hexColor(0x333333)
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.masksToBounds = true
        passwordTextField.placeholder = "请输入密码"
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTextField.snp.bottom).offset(15)
            make.height.equalTo(50)
        }
        
        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        loginButton.layer.cornerRadius = 5
        loginButton.layer.masksToBounds = true
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
        loginButton.addTarget(self, action: #selector(didClickLoginButton(sender:)), for: .touchUpInside)
    }
    
    @objc func didClickLoginButton(sender: UIButton) {
        if validatePhoneNumber(phoneTextField.text ?? "") && validatePasswordNumber(passwordTextField.text ?? "") {
            weak var weakSelf = self
            self.showToast("登录成功~") {
                weakSelf?.navigationController?.popViewController(animated: true)
            }
        } else {
            self.showToast("用户名或者密码错误")
        }
        
    }
    
    func showToast(_ message: String, completin: (() -> Void)? = nil) {
        let alertViewVC = UIAlertController(title: "提示", message: message, preferredStyle: .alert)
        present(alertViewVC, animated: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            
            alertViewVC.dismiss(animated: true, completion: completin)
//            alertViewVC.dismiss(animated: true) {
//                if let block = completin {
//                    block()
//                }
//            }
        }
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
