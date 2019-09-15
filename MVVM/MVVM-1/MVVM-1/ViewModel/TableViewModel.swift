//
//  TableViewModel.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class TableViewModel: TableViewViewModelProtocol {
    
    let networkManager: ManagerProtocol!
    
    init(networkManager: ManagerProtocol, completion: @escaping (Error?) -> ()) {
        self.networkManager = networkManager
        fetchData { (err) in
            if let err = err {
                completion(err)
            }
            completion(nil)
        }
    }
    
    private var users = [Users]()
    
    private var selectedIndexPath: IndexPath?
    
    func fetchData(completion: @escaping(Error?) -> ()) {
        
        networkManager.getUser({ [weak self] (user, err) in
            if let err = err {
                completion(err)
                return
            }
            guard let user = user else { return }
            self?.users.append(user)
            
            completion(nil)
        })
        
    }
    
    func numberOfRows() -> Int {
        return users.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellProtocol? {
        return TableViewCellViewModel(user: users[indexPath.row])
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol? {
        guard
            let selectedIndexPath = selectedIndexPath
            else { return nil }
        
        return DetailViewModel(user: users[selectedIndexPath.row])
    }
    
}
