//
//  MainRouter.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 15/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class MainRouter: RouterProtocol {
    weak var viewController: TableViewController!
    
    required init(viewController: TableViewController) {
        self.viewController = viewController
    }
    
    func navigate(to route: Route) {
        viewController.performSegue(withIdentifier: route.rawValue, sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue) {
        guard let segueID = segue.identifier,
            let route = TableViewController.Route(rawValue: segueID)  else {
                return
        }
        
        switch route {
        case .detail:
            passDataToDetail(segue)
        }
    }
}

extension MainRouter {
    private func passDataToDetail(_ segue: UIStoryboardSegue) {
        let detailVC = segue.destination as! DetailViewController
        detailVC.viewModel = viewController.viewModel?.viewModelForSelectedRow()
    }
}
