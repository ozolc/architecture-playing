//
//  DetailViewModel.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 15/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class DetailViewModel: DetailViewModelProtocol {
  
    private var user: Users
    
    var description: String {
        guard
            let firstName = (self.user.results?.first?.name?.first)?.capitalized,
            let lastName = (self.user.results?.first?.name?.last)?.capitalized,
            let title = self.user.results?.first?.name?.title else { return "" }
        return String(describing: "\(title). \(firstName) \(lastName)")
    }
    
    init(user: Users) {
        self.user = user
    }
}
