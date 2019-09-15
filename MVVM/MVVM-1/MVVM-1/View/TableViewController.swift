//
//  ViewController.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var viewModel: TableViewViewModelProtocol?
    var router: RouterProtocol!
    
    enum Route: String {
        case detail
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        router = MainRouter(viewController: self)
        viewModel = TableViewModel(networkManager: NetworkManager(), completion: { [weak self] (err) in
            if let err = err {
                print("Returned an error:", err.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
        
        guard let tableViewCell = cell else { return UITableViewCell() }
        
        let cellViewModel = viewModel?.cellViewModel(forIndexPath: indexPath)
        
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModel = viewModel else { return }
        viewModel.selectRow(atIndexPath: indexPath)
        
        self.router.navigate(to: .detail)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        router.prepare(for: segue)
    }
    
}

