//
//  UserViewController.swift
//  MVP-1
//
//  Created by Maksim Nosov on 17/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var emptyView: UIView?
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView?
    
    private var userPresenter: UserPresenterProtocol!
    private var usersToDisplay = [UserViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userPresenter = UserPresenter(view: self)
        
        tableView?.dataSource = self
        activityIndicator?.hidesWhenStopped = true
    }
}

extension UserViewController: UserViewProtocol {
    func startLoading() {
        activityIndicator?.startAnimating()
    }
    
    func finishLoading() {
        activityIndicator?.stopAnimating()
    }
    
    func setUsers(users: [UserViewData]) {
        usersToDisplay = users
        tableView?.isHidden = false
        emptyView?.isHidden = true
        tableView?.reloadData()
    }
    
    func setEmptyUsers() {
        tableView?.isHidden = true
        emptyView?.isHidden = false
    }
    
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "userCell")
        
        let userViewData = usersToDisplay[indexPath.row]
        cell.textLabel?.text = userViewData.name
        cell.detailTextLabel?.text = userViewData.age
        
        return cell
    }
}
