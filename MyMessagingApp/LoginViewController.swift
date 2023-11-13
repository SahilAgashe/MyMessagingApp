//
//  LoginViewController.swift
//  MyMessagingApp
//
//  Created by SAHIL AMRUT AGASHE on 13/11/23.
//

import UIKit

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
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextFieldDelegate()
    }
    
    // MARK: - IBActions
    @IBAction func loginButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func resendEmailButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
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
    
    // MARK: - Animations
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
}
