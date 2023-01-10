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
    var addButton: UIButton!
    var pickerView: UIPickerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addButton.layer.cornerRadius = addButton.frame.size.height / 5
        addButton.clipsToBounds = true
    }
    
    @objc func addButtonTapped() {
        let authModel = AuthModel(context: CoreDataHandler.coreDataContext)
        authModel.title = titleTextField.text
        authModel.code = codeTextField.text
        CoreDataHandler.shared.addData(data: authModel)
        AuthModel.authModelList.append(authModel)
        navigationController?.popViewController(animated: true)
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        titleTextField = UITextField()
        titleTextField.backgroundColor = UIColor(named: "SearchFieldBackgroundColor")
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.borderStyle = .roundedRect
        titleTextField.placeholder = "Enter title"
        
        codeTextField = UITextField()
        codeTextField.backgroundColor = UIColor(named: "SearchFieldBackgroundColor")
        codeTextField.translatesAutoresizingMaskIntoConstraints = false
        codeTextField.borderStyle = .roundedRect
        codeTextField.placeholder = "Enter code"
        
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add", for: .normal)
        addButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        addButton.tintColor = .white
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(titleTextField)
        view.addSubview(codeTextField)
        view.addSubview(addButton)
        view.addSubview(pickerView)
        
        NSLayoutConstraint.activate([
            // title
            titleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleTextField.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.05),
            //CODE
            codeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            codeTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            codeTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            codeTextField.heightAnchor.constraint(equalTo: titleTextField.heightAnchor,multiplier: 1),
            
            // button
            addButton.topAnchor.constraint(equalTo: codeTextField.bottomAnchor, constant: 10),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // width
            addButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.06),
            
            // Height
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1.5),
            
            //picker
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pickerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
            
            pickerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            pickerView.bottomAnchor.constraint(equalTo: titleTextField.topAnchor,constant: 10)
        ])
        
    }
    
}

extension AddCodeViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        3
    }
    
    
}

extension AddCodeViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "Yoo"
    }
}
