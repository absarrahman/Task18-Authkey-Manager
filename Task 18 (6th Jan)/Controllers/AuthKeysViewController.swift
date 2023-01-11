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
    var searchField: UITextField!
    var stackView: UIStackView!
    
    var gameFilterButton: UIButton!
    var workFilterButton: UIButton!
    var otherFilterButton: UIButton!
    var clearFilterButton: UIButton!
    
    var selectedFilterType = "" // Empty means no filter
    
    let coreDataManager: CoreDataHandler = CoreDataHandler.shared
    
    var loggedInSessionData : [String:Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let fetchedData = PlistHandler.readFromPlist() {
            loggedInSessionData = fetchedData
        }
        print("\(loggedInSessionData) line 31")
        let currentSession = CommonFunctions.getCurrentTime()
        loggedInSessionData[currentSession.0] = currentSession.1
        print("\(loggedInSessionData) line 34")
        PlistHandler.writeToPlist(with: loggedInSessionData)
        
        let leftButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutTapped))
        
        let rightButton = UIBarButtonItem(title: "Login time", style: .plain, target: self, action: #selector(loginSessionTable))
        
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
        navigationItem.title = "Authkey Manager"
        tableView.dataSource = self
        tableView.delegate = self
        searchField.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        AuthModel.authModelList = coreDataManager.fetchDataFromCoreData(type: AuthModel.self, entityName: Constants.DBEntityConstants.entityName)
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addButton.layer.cornerRadius = addButton.frame.size.height / 2
        addButton.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    
    fileprivate func setupTableViewConstraints() {
        NSLayoutConstraint.activate([
            // TOP CONSTRAINT
            tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor),
            
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
        label.text = "Hey Absar"
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
        emptyTextLabel.text = "No data available"
        emptyTextLabel.textColor = .systemMint
        emptyTextLabel.numberOfLines = 0
        emptyTextLabel.textAlignment = .center
        emptyTextLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        // TOP UI VIEW outlet
        setupTopUIViewOutlet()
        
        //TEXTFIELD
        searchField = UITextField()
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.backgroundColor = UIColor(named: "SearchFieldBackgroundColor")
        searchField.borderStyle = .roundedRect
        searchField.autocorrectionType = .no
        searchField.autocapitalizationType = .none
        
        // STACKVIEW
        stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
       
        
        // FILTER BUTTONS
        gameFilterButton = UIButton()
        gameFilterButton.translatesAutoresizingMaskIntoConstraints = false
        gameFilterButton.setTitle("Game", for: .normal)
        gameFilterButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        gameFilterButton.tintColor = .label
        
        workFilterButton = UIButton()
        workFilterButton.translatesAutoresizingMaskIntoConstraints = false
        workFilterButton.setTitle("Work", for: .normal)
        workFilterButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        workFilterButton.tintColor = .label
        
        otherFilterButton = UIButton()
        otherFilterButton.translatesAutoresizingMaskIntoConstraints = false
        otherFilterButton.setTitle("Others", for: .normal)
        otherFilterButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        otherFilterButton.tintColor = .label
        
        clearFilterButton = UIButton()
        clearFilterButton.translatesAutoresizingMaskIntoConstraints = false
        clearFilterButton.setTitle("Clear", for: .normal)
        clearFilterButton.backgroundColor = UIColor(named: "PrimaryButtonColor")
        clearFilterButton.tintColor = .label
        
        
        stackView.addArrangedSubview(gameFilterButton)
        stackView.addArrangedSubview(workFilterButton)
        stackView.addArrangedSubview(otherFilterButton)
        stackView.addArrangedSubview(clearFilterButton)
        
        view.addSubview(tableView)
        view.addSubview(emptyTextLabel)
        view.addSubview(addButton)
        view.addSubview(stackView)
        view.addSubview(topUIView)
        view.addSubview(searchField)
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
    
    fileprivate func setupSearchFieldConstraints() {
        NSLayoutConstraint.activate([
            searchField.topAnchor.constraint(equalTo: topUIView.bottomAnchor,constant: 10),
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    fileprivate func setupButtonStackConstraints() {
        // stack view
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: searchField.bottomAnchor,constant: 10),
            stackView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
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
        
        //SEARCH FIELD CONSTRAINTS
        setupSearchFieldConstraints()
        
        // Button stack view
        setupButtonStackConstraints()
        
    }
    
    @objc func logoutTapped() {
        print("YEEET")
        let alertController = UIAlertController(title: "Do you want to logout", message: "Click yes to confirm", preferredStyle: .alert)
        
        
        let saveAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            guard let self = self else {
                return
            }
            self.navigationController?.popViewController(animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    @objc func addButtonTapped() {
//        print("ADD BUTTON TAPPED")
//        let alertController = UIAlertController(title: "Add code", message: "Enter the title and the code", preferredStyle: .alert)
//
//        alertController.addTextField {textField in
//            textField.placeholder = "Add title"
//        }
//
//        alertController.addTextField {textField in
//            textField.placeholder = "Add code"
//        }
//
//        let successAction = UIAlertAction(title: "Add", style: .default) {[weak self] _ in
//
//
//            // ADD
//            guard let self = self, let titleText = alertController.textFields?.first?.text, let codeText = alertController.textFields?[1].text else { return }
//            let authModel = AuthModel(context: CoreDataHandler.coreDataContext)
//            authModel.title = titleText
//            authModel.code = codeText
//            self.coreDataManager.addData(data: authModel)
//            AuthModel.authModelList.append(authModel)
//            self.tableView.reloadData()
//
//        }
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//
//        alertController.addAction(successAction)
//        alertController.addAction(cancelAction)
//        present(alertController, animated: true)
        performSegue(withIdentifier: Constants.RoutesConstants.goToAddVC, sender: nil)
    }
    
    @objc func loginSessionTable() {
        // NAVIGATE TO LOGIN SESSION TABLE
        performSegue(withIdentifier: Constants.RoutesConstants.goToLoginSession, sender: nil)
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
        cell.typeLabel.text = model.codeType?.typeName?.capitalized ?? "N/A"
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

extension AuthKeysViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        AuthModel.authModelList = CoreDataHandler.shared.fetchDataFromCoreData(type: AuthModel.self, entityName: Constants.DBEntityConstants.entityName,field: textField.text ?? "")
        tableView.reloadData()
        return true
    }
}
