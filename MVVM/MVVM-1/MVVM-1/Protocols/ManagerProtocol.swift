//
//  ManagerProtocol.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 15/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

protocol ManagerProtocol {
    func getUser(_ completionHandler: @escaping(Users?, Error?) -> ())
}
