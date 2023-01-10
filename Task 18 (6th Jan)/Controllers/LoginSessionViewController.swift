//
//  LoginSessionViewController.swift
//  Task 18 (6th Jan)
//
//  Created by BJIT  on 10/1/23.
//

import UIKit

class LoginSessionViewController: UIViewController {
    
    var tableView: UITableView!
    
    var loginSession: [String: Any] = [:]
    var sessionArray : [(String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        // Do any additional setup after loading the view.
        if let fetchedData = PlistHandler.readFromPlist() {
            loginSession = fetchedData
        }
        
        sessionArray = loginSession.map {
            ("\($0)","\($1)")
        }
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    override func loadView() {
        view = UIView()
        //view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor,constant: 10),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor,constant: 10)
        ])
        
    }

}

extension LoginSessionViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sessionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        
        cell.titleLabel.text = sessionArray[indexPath.row].0
        cell.codeLabel.text = sessionArray[indexPath.row].1
        return cell
    }
    
    
}
