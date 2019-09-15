//
//  Users.swift
//  MVVM-1
//
//  Created by Maksim Nosov on 14/09/2019.
//  Copyright © 2019 Maksim Nosov. All rights reserved.
//

import Foundation

public struct Users: Codable {
    let results: [Result]?
}

struct Result: Codable {
    let name: NameClass?
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try? container.decode(NameClass.self, forKey: .name)
    }
}

struct NameClass: Codable {
    let title: Title?
    let first, last: String?
}

enum Title: String, Codable {
    case madame
    case mademoiselle
    case miss
    case monsieur
    case mr
    case mrs
    case ms
}
