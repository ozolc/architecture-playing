//
//  TableViewCellViewModel.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class TableViewCellViewModel: TableViewCellProtocol {
    
    private var user: Users
    
    var fullName: String {
        
        let firstName = user.results?.first?.name?.first ?? ""
        let lastName = user.results?.first?.name?.last ?? ""
        let fullName = "\(firstName) \(lastName)"
        
        print(fullName)
        return fullName
    }
    
    init(user: Users) {
        self.user = user
    }
}
