//
//  TableViewModel.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class TableViewModel: NSObject {
    
    let networkManager = NetworkManager()
    let dispatchGroup = DispatchGroup()
    
    private var users = [Users]()
    
    func fetchData(completion: @escaping() -> ()) {
        dispatchGroup.enter()
        
        networkManager.getUser({ [weak self] (user, err) in
            guard err == nil else {
                print("Returned an error:")
                return
            }
                guard let user = user else { return }
                self?.users.append(user)
            //                self?.dispatchGroup.wait()
            
            completion()
        })
        
    }
    
    func numberOfRows() -> Int {
        return users.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellProtocol? {
        
        let user = users[indexPath.row]
        return TableViewCellViewModel(user: user)
        
    }
    
}
