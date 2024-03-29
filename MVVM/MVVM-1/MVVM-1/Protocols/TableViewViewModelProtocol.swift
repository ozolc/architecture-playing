//
//  TableViewViewModelProtocol.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

protocol TableViewViewModelProtocol {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellProtocol?
    
    func viewModelForSelectedRow() -> DetailViewModelProtocol?
    func selectRow(atIndexPath indexPath: IndexPath)
    
    func login(completion: () -> Void)
    
//    var users: Box<[Users]?> { get }
    
//    func reloadTableViewClosure(_: () -> ()?)
    
//    func fetchData(completion: @escaping() -> ())
}
