//
//  UserPresenter.swift
//  MVP-1
//
//  Created by Maksim Nosov on 17/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

protocol UserPresenterProtocol {
    func getUsers()
}

import Foundation

class UserPresenter: UserPresenterProtocol {
    private let localUserService: UserServiceProtocol!
    weak private var view: UserViewProtocol?
    
    init(view: UserViewProtocol) {
        self.view = view
        localUserService = UserService()
        getUsers()
    }
    
    func getUsers() {
        self.view?.startLoading()
        localUserService.getUsers { [weak self] (users) in
            self?.view?.finishLoading()
            if users.count == 0 {
                self?.view?.setEmptyUsers()
            } else {
                let mappedUsers = users.map {
                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.view?.setUsers(users: mappedUsers)
            }
        }
    }
    
}
