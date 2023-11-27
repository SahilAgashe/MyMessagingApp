//
//  LoginViewController.swift
//  MyMessagingApp
//
//  Created by SAHIL AMRUT AGASHE on 13/11/23.
//

import UIKit
import ProgressHUD

class LoginViewController: UIViewController {
    
    
    // MARK: - IBOutlets
    //labels
    @IBOutlet weak var emailLabelOutlet: UILabel!
    @IBOutlet weak var passwordLabelOutlet: UILabel!
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var signUpLabel: UILabel!
    
    //textFields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    //buttons
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    @IBOutlet weak var resendEmailButtonOutlet: UIButton!
    
    //views
    @IBOutlet weak var repeatPasswordLineView: UIView!
    
    // MARK: - Vars
    var isLogin = true
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundTap()
        updateUIFor(login: true)
        setupTextFieldDelegate()
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: isLogin ? "login" : "registration") {
            // login or registration
            print("DEBUG: have data for login or registration")
        } else {
            ProgressHUD.failed("All Fields are required.")
        }
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: "password") {
            // reset password
            print("DEBUG: have data for forgot password")
        } else {
            ProgressHUD.failed("Email is required.")
        }
    }
    
    @IBAction func resendEmailButtonPressed(_ sender: Any) {
        if isDataInputedFor(type: "password") {
            // resend email
            print("DEBUG: have data for resend email")
        } else {
            ProgressHUD.failed("Email is required.")
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        updateUIFor(login: sender.titleLabel?.text == "Login")
        isLogin.toggle()
    }
    
    // MARK: - Setup
    private func setupTextFieldDelegate() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        repeatPasswordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("DEBUG: changing text field")
        updatePlaceholderLabels(textField: textField)
    }
    
    private func setupBackgroundTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(backgroundTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func backgroundTap() {
        print("DEBUG: backgroundTap Called...")
        view.endEditing(true)
    }
    
    // MARK: - Animations
    
    private func updateUIFor(login: Bool) {
        loginButtonOutlet.setImage(UIImage(named: login ? "loginBtn" : "registerBtn"), for: .normal)
        signUpButtonOutlet.setTitle(login ? "SignUp" : "Login", for: .normal)
        
        signUpLabel.text = login ? "Don't have an account" : "Have an account"
        
        UIView.animate(withDuration: 0.5) {
            self.repeatPasswordTextField.isHidden = login
            self.repeatPasswordLabel.isHidden = login
            self.repeatPasswordLineView.isHidden = login
        }
    }
    
    private func updatePlaceholderLabels(textField: UITextField) {
    
        switch textField {
        case emailTextField:
            emailLabelOutlet.text = textField.hasText ? "Email": ""
        case passwordTextField:
            passwordLabelOutlet.text = textField.hasText ? "Password": ""
        default:
            repeatPasswordLabel.text = textField.hasText ? "Repeat Password": ""
        }
        
    }
    
    // MARK: - Helpers
    private func isDataInputedFor(type: String) -> Bool {
        switch type {
        case "login":
            return emailTextField.text != "" && passwordTextField.text != ""
        case "registration":
            return emailTextField.text != "" && passwordTextField.text != "" && repeatPasswordTextField.text != ""
        default:
            return emailTextField.text != ""
        }
    }
    
}
