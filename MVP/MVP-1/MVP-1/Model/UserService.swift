//
//  UserService.swift
//  MVP-1
//
//  Created by Maksim Nosov on 17/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

protocol UserServiceProtocol {
    func getUsers(callback: @escaping([User]) -> Void)
}

class UserService: UserServiceProtocol {
    
    func getUsers(callback: @escaping ([User]) -> Void) {
        let users = [
            User(firstName: "Maksim", lastName: "Nosov", email: "ozolc@yandex.ru", age: 36),
            User(firstName: "Andrey", lastName: "Myzika", email: "and@ukr.net", age: 46),
            User(firstName: "Ivan", lastName: "Sidorov", email: "ivans@mail.ru", age: 32)
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            callback(users)
        }
    }
}
