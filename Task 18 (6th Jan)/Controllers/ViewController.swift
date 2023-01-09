//
//  ViewController.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 6/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    var welcomeLabel: UILabel!
    var userTextFieldTopLabel: UILabel!
    var passwordTextFieldTopLabel: UILabel!
    var userTextField: UITextField!
    var passwordTextField: UITextField!
    var signInButton: UIButton!
    var themeButton: UIButton!
    var isDark = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        isDark =  UserDefaults.standard.bool(forKey: Constants.UserDefaultKeys.themeKey)
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print(view.window?.overrideUserInterfaceStyle)
//    }
    
    fileprivate func setTheme() {
        //print(view.window?.overrideUserInterfaceStyle)
        view.window?.overrideUserInterfaceStyle = isDark ? .dark : .light
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setTheme()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.layer.cornerRadius = signInButton.frame.size.height / 5
        signInButton.clipsToBounds = true
        
        themeButton.layer.cornerRadius = themeButton.frame.size.height / 2
        themeButton.clipsToBounds = true
    }
    
    @objc func signInButtonTapped() {
        performSegue(withIdentifier: "goToAuthKeys", sender: nil)
    }
    
    @objc func themeButtonTapped() {
        //
        isDark = !isDark
        UserDefaults.standard.set(isDark, forKey: Constants.UserDefaultKeys.themeKey)
        setTheme()
    }
    
    fileprivate func setupOutlets() {
        // WELCOME LABEL
        
        welcomeLabel = UILabel()
        
        // USER TEXTFIELD and LABEL
        userTextField = UITextField()
        userTextFieldTopLabel = UILabel()
        
        // PASSWORD TEXTFIELD and LABEL
        passwordTextField = UITextField()
        passwordTextFieldTopLabel = UILabel()
        
        // BUTTON
        signInButton = UIButton()
        
        // THEME BUTTON
        themeButton = UIButton()
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        userTextFieldTopLabel.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextFieldTopLabel.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        themeButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(welcomeLabel)
        
        view.addSubview(userTextField)
        view.addSubview(userTextFieldTopLabel)
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordTextFieldTopLabel)
        
        view.addSubview(signInButton)
        
        view.addSubview(themeButton)
        
        
        
        // WELCOME LABEL PROPERTIES
        
        
        welcomeLabel.text = "Authkey Manager"
        welcomeLabel.textColor = .systemBackground
        welcomeLabel.font = welcomeLabel.font.withSize(30)
        welcomeLabel.textAlignment = .center
        
        
        // USERNAME TEXTFIELD PROPERTIES
        userTextField.font = .systemFont(ofSize: 14)
        userTextField.textColor = .label
        userTextField.borderStyle = .roundedRect
        
        userTextFieldTopLabel.textColor = .white
        userTextFieldTopLabel.text = "Username"
        
        
        // PASSWORD TEXTFIELD PROPERTIES
        passwordTextField.font = .systemFont(ofSize: 14)
        passwordTextField.textColor = .label
        passwordTextField.borderStyle = .roundedRect
        
        passwordTextFieldTopLabel.textColor = .white
        passwordTextFieldTopLabel.text = "Password"
        
        // SIGN IN BUTTON
        signInButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInButton.tintColor = .label
        
        
        // THEME BUTTON
        themeButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        themeButton.tintColor = .white
        themeButton.setImage(UIImage(systemName: "moon.fill",withConfiguration: UIImage.SymbolConfiguration(scale: .large)), for: .normal)

        themeButton.addTarget(self, action: #selector(themeButtonTapped), for: .touchUpInside)
        
    }
    
    fileprivate func setupWelcomeLabelConstraints() {
        
        //WELCOME CONSTRAINTS
        NSLayoutConstraint.activate([
            // CENTER Y
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // LEFT
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            // bottom
            userTextFieldTopLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor,constant: 50)
        ])
        
    }
    
    fileprivate func setupUserTextFieldConstraints() {
        // USER TEXT FIELD CONSTRAINTS
        
        NSLayoutConstraint.activate([
            // CENTER Y
            userTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            // CENTER X
            userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // WIDTH
            userTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            
            // TOP ANCHOR
            userTextField.topAnchor.constraint(equalTo: userTextFieldTopLabel.bottomAnchor,constant: 10),
        ])
        
        // TOP LABEL CONSTRAINTS
        
        NSLayoutConstraint.activate([
            // Center x
            userTextFieldTopLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // leading
            userTextFieldTopLabel.leadingAnchor.constraint(equalTo: userTextField.leadingAnchor),
            
            // bottom
            
            userTextField.topAnchor.constraint(equalTo: userTextFieldTopLabel.bottomAnchor, constant: 10)
            
        ])
    }
    
    fileprivate func setupPasswordTextFieldConstraints() {
        // PASSWORD TEXTFIELD TOP LABEL
        NSLayoutConstraint.activate([
            // TOP
            passwordTextFieldTopLabel.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 10),
            // LEADING
            passwordTextFieldTopLabel.leadingAnchor.constraint(equalTo: userTextFieldTopLabel.leadingAnchor),
            // CENTER X
            passwordTextFieldTopLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
        // PASSWORD TEXTFIELD
        NSLayoutConstraint.activate([
            // top
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldTopLabel.bottomAnchor,constant: 10),
            // CENTER X
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // WIDTH
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
        ])
    }
    
    fileprivate func signInButtonConstraints() {
        NSLayoutConstraint.activate([
            // TOP
            signInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            // width
            signInButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            // Height
            signInButton.widthAnchor.constraint(equalTo: signInButton.heightAnchor, multiplier: 1.5),
            
            //center x
            
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemMint
        
        // Outlets
        setupOutlets()
        
        // Welcome constraints
        setupWelcomeLabelConstraints()
        
        // usernameTextFieldConstraints
        setupUserTextFieldConstraints()
        
        // password TextFieldConstraints
        setupPasswordTextFieldConstraints()
        
        // Sign in Button Constraints
        signInButtonConstraints()
        
        // Theme button constraints
        NSLayoutConstraint.activate([
            // TOP anchor
            themeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            // Trailing
            view.trailingAnchor.constraint(equalTo: themeButton.trailingAnchor, constant: 20),
            // height
            themeButton.heightAnchor.constraint(equalTo:view.heightAnchor, multiplier: 0.07),
            // width
            themeButton.widthAnchor.constraint(equalTo: themeButton.heightAnchor, multiplier: 1)
        ])
    }

}

