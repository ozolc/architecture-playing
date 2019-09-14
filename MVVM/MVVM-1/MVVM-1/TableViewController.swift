//
//  ViewController.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var users = [Users]()
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callAPI()
    }
    
    fileprivate func callAPI() {
        for _ in 0..<3 {
            
            dispatchGroup.enter()
            getUser({ [unowned self] (user, err) in
                
                guard err == nil else {
                    print("Returned an error:")
                    return
                }
                
                guard let user = user else { return }
                self.users.append(user)
                self.dispatchGroup.leave()
                print(self.users.count)
            })
            dispatchGroup.wait()
        }
        
        dispatchGroup.notify(queue: .main) {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print("Reload table", self.users.count)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let result = users[indexPath.row].results
        
        let firstName = result?.first?.name?.first ?? ""
        let lastName = result?.first?.name?.last ?? ""
        let fullName = "\(firstName) \(lastName)"
        
        cell.textLabel?.text = fullName
        
        return cell
    }
    
    fileprivate func getUser(_ completionHandler: @escaping (_ data: Users?, _ error: Error?) -> Void) {
        guard let url = URL(string: "https://randomuser.me/api") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            guard
                error == nil,
                let data = data else {
                    completionHandler(nil, error)
                    return
            }
            
            let users = try? JSONDecoder().decode(Users.self, from: data)
            completionHandler(users, nil)
        }
        
        task.resume()
    }
    
}

