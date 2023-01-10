//
//  AddCodeViewController.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 10/1/23.
//

import UIKit

class AddCodeViewController: UIViewController {
    
    var titleTextField: UITextField!
    var codeTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        titleTextField = UITextField()
        titleTextField.backgroundColor = UIColor(named: "SearchFieldBackgroundColor")
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        codeTextField = UITextField()
        codeTextField.backgroundColor = UIColor(named: "SearchFieldBackgroundColor")
        codeTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleTextField)
        view.addSubview(codeTextField)
        
        NSLayoutConstraint.activate([
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            codeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            codeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            titleTextField.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.05),
            codeTextField.heightAnchor.constraint(equalTo: titleTextField.heightAnchor,multiplier: 1)
        ])
        
    }

}
