//
//  RouterProtocol.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 15/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

protocol RouterProtocol {
    typealias Route = TableViewController.Route
    
    var viewController: TableViewController! { get }
    init(viewController: TableViewController)
    
    func navigate(to route: Route)
    func prepare(for segue: UIStoryboardSegue)
}
