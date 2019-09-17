//
//  UserViewProtocol.swift
//  MVP-1
//
//  Created by Maksim Nosov on 17/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

protocol UserViewProtocol: class {
    func startLoading()
    func finishLoading()
    func setUsers(users: [UserViewData])
    func setEmptyUsers()
}
