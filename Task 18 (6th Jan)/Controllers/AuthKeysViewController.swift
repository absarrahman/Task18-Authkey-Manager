//
//  AuthKeysViewController.swift
//  Task 18 (6th Jan)
//
//  Created by Moh. Absar Rahman on 7/1/23.
//

import UIKit
import CoreData

class AuthKeysViewController: UIViewController {
    
    
    var tableView: UITableView!
    var addButton: UIButton!
    
    var emptyTextLabel: UILabel!
    var topUIView: UIView!
    
    let coreDataManager: CoreDataHandler = CoreDataHandler.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = "Authkey Manager"
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        AuthModel.authModelList = coreDataManager.fetchDataFromCoreData(dataFetchRequest: AuthModel.fetchRequest())
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addButton.layer.cornerRadius = addButton.frame.size.height / 2
        addButton.clipsToBounds = true
    }
    
    
    fileprivate func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            // TOP CONSTRAINT
            tableView.topAnchor.constraint(equalTo: topUIView.bottomAnchor),
            
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
    
    fileprivate func setupEmptyLabelConstraints() {
        // label constraints
        
        NSLayoutConstraint.activate([
            emptyTextLabel.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            emptyTextLabel.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
            emptyTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10)
        ])
    }
    
    fileprivate func setupTopUIViewOutlet() {
        // TOP UI VIEW
        topUIView = UIView()
        topUIView.translatesAutoresizingMaskIntoConstraints = false
        topUIView.backgroundColor = .systemMint
        
        // LABEL
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hey [Absar]"
        label.textColor = .white
        label.font = .systemFont(ofSize: 25, weight: .bold)
        
        // IMAGE
        
        let image = UIImage(systemName: "lock.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        topUIView.addSubview(imageView)
        
        topUIView.addSubview(label)
        
        // FOR THE LABEL CONSTRAINT
        NSLayoutConstraint.activate([
            // LABEL
            label.leadingAnchor.constraint(equalTo: topUIView.leadingAnchor,constant: 10),
            label.centerYAnchor.constraint(equalTo: topUIView.centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            // IMAGE
            topUIView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 10),
            imageView.centerYAnchor.constraint(equalTo: topUIView.centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: topUIView.heightAnchor, multiplier: 0.3),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1)
        ])
        
    }
    
    fileprivate func setupOutlets() {
        
        // TABLEVIEW
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        // ADD BUTTON
        addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        addButton.tintColor = .white
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        
        
        // LABEL
        emptyTextLabel = UILabel()
        emptyTextLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyTextLabel.text = "Looks like you have not added any codes yet. Try adding some."
        emptyTextLabel.textColor = .systemMint
        emptyTextLabel.numberOfLines = 0
        emptyTextLabel.textAlignment = .center
        emptyTextLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        // TOP UI VIEW outlet
        setupTopUIViewOutlet()
        
        view.addSubview(tableView)
        view.addSubview(emptyTextLabel)
        view.addSubview(addButton)
        view.addSubview(topUIView)
    }
    
    fileprivate func setupTopViewConstraints() {
        // TOP UIView
        NSLayoutConstraint.activate([
            // TOP CONSTRAINT
            topUIView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            // LEADING CONSTRAINT
            topUIView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            // center x
            topUIView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Height
            topUIView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        setupOutlets()
        
        // TABLEVIEW CONSTRAINTS
        setupTableViewConstraints()
        
        // ADD BUTTON CONSTRAINTS
        addButtonConstraints()
        
        // Label Constraints
        setupEmptyLabelConstraints()
        
        // TOP view constraints
        setupTopViewConstraints()
        
    }
    
    @objc func addButtonTapped() {
        print("ADD BUTTON TAPPED")
        let alertController = UIAlertController(title: "Add code", message: "Enter the title and the code", preferredStyle: .alert)
        
        alertController.addTextField {textField in
            textField.placeholder = "Add title"
        }
        
        alertController.addTextField {textField in
            textField.placeholder = "Add code"
        }
        
        let successAction = UIAlertAction(title: "Add", style: .default) {[weak self] _ in
            
            
            // ADD
            guard let self = self, let titleText = alertController.textFields?.first?.text, let codeText = alertController.textFields?[1].text else { return }
            let authModel = AuthModel(context: CoreDataHandler.coreDataContext)
            authModel.title = titleText
            authModel.code = codeText
            self.coreDataManager.addData(data: authModel)
            AuthModel.authModelList.append(authModel)
            self.tableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(successAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

}

extension AuthKeysViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emptyTextLabel.alpha = AuthModel.authModelList.isEmpty ? 1 : 0
        return AuthModel.authModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        let model = AuthModel.authModelList[indexPath.row]
        
        cell.titleLabel.text = model.title
        cell.codeLabel.text = model.code
        return cell
       // UITableViewCell()
    }
    
    
}


extension AuthKeysViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let model = AuthModel.authModelList[indexPath.row]
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {[weak self] swipeAction, _, _ in
            guard let self = self else {
                return
            }
            self.coreDataManager.removeData(data: model)
            AuthModel.authModelList.remove(at: indexPath.row)
            self.tableView.reloadData()
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = AuthModel.authModelList[indexPath.row]
        let alertController = UIAlertController(title: "Add code", message: "Enter the title and the code", preferredStyle: .alert)
        
        alertController.addTextField {textField in
            textField.placeholder = "Edit title"
            textField.text = model.title
        }
        
        alertController.addTextField {textField in
            textField.placeholder = "Edit code"
            textField.text = model.code
        }
        
        let successAction = UIAlertAction(title: "Edit", style: .default) {[weak self] _ in
            
            
            // ADD
            guard let self = self, let titleText = alertController.textFields?.first?.text, let codeText = alertController.textFields?[1].text else { return }
            model.title = titleText
            model.code = codeText
            self.coreDataManager.updateData(data: model)
            self.tableView.reloadData()
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(successAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
