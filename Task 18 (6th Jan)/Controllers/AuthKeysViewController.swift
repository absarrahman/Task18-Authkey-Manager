//
//  AuthKeysViewController.swift
//  Task 18 (6th Jan)
//
//  Created by Moh. Absar Rahman on 7/1/23.
//

import UIKit

class AuthKeysViewController: UIViewController {
    
    
    var tableView: UITableView!
    var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "Authkey Manager"
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addButton.layer.cornerRadius = addButton.frame.size.height / 2
        addButton.clipsToBounds = true
    }
    
    
    fileprivate func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            // TOP CONSTRAINT
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            // LEADING CONSTRAINT
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            // TRAILING CONSTRAINT
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor, constant: 10),
            
            // BOTTOM CONSTRAINT
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10)
        ])
    }
    
    fileprivate func addButtonConstraints() {
        NSLayoutConstraint.activate([
            // bottom constraint
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 10),
            
            // trailing CONSTRAINT
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: addButton.trailingAnchor,constant: 20),
            
            // HEIGHT CONSTRAINT
            addButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.09),
            
            // WIDTH CONSTRAINT
            addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1)
        ])
    }
    
    fileprivate func setupOutlets() {
        
        // TABLEVIEW
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        // ADD BUTTON
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        addButton.tintColor = .white
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        view.addSubview(tableView)
        view.addSubview(addButton)
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        setupOutlets()
        
        // TABLEVIEW CONSTRAINTS
        setupTableViewConstraints()
        
        // ADD BUTTON CONSTRAINTS
        addButtonConstraints()
        
    }
    
    @objc func addButtonTapped() {
        print("ADD BUTTON TAPPED")
        let alertController = UIAlertController(title: "Add code", message: "Enter the title and the code", preferredStyle: .alert)
        let successAction = UIAlertAction(title: "Add", style: .default) { _ in
            // ADD
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(successAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

}

extension AuthKeysViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.titleLabel.text = "Yeet"
        cell.codeLabel.text = "Yeet 2"
        return cell
       // UITableViewCell()
    }
    
    
}
