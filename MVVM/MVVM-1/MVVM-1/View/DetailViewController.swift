//
//  DetailViewController.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 15/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var viewModel: DetailViewModelProtocol?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let viewModel = viewModel else { return }
        textLabel.text = viewModel.description
    }
    
}
