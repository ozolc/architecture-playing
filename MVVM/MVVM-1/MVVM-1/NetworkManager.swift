//
//  NetworkManager.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
            
        func getUser(_ completionHandler: @escaping (_ data: Users?, _ error: Error?) -> Void) {
            guard let url = URL(string: "https://randomuser.me/api") else { return }
            let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
                
                guard
                    error == nil,
                    let data = data else {
                        completionHandler(nil, error)
                        return
                }
                
                let users = try? JSONDecoder().decode(Users.self, from: data)
                completionHandler(users, nil)
            }
            
            task.resume()
        }
//    }
}
