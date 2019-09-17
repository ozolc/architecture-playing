//
//  UserPresenter.swift
//  MVP-1
//
//  Created by Maksim Nosov on 17/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class UserPresenter {
    private let userService: UserService
    weak private var userView: UserViewProtocol?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func attachView(view: UserViewProtocol) {
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getUsers() {
        self.userView?.startLoading()
        userService.getUsers { [weak self] (users) in
            self?.userView?.finishLoading()
            if (users.count == 0) {
                self?.userView?.setEmptyUsers()
            } else {
                let mappedUsers = users.map {
                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.userView?.setUsers(users: mappedUsers)
            }
        }
    }
    
}
