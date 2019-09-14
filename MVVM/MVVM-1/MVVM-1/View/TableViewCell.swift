//
//  TableViewCell.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var fullNameLabel: UILabel!
    
    weak var viewModel: TableViewCellProtocol? {
        willSet(viewModel) {
            fullNameLabel.text = viewModel?.fullName
        }
    }
}
