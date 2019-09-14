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
    let info: Info?
}

struct Info: Codable {
    let seed: String?
    let results, page: Int?
    let version: String?
}

struct Result: Codable {
//    let gender: Gender?
    let name: NameClass?
//    let email: String?
//    let login: Login?
//    let phone, cell: String?
//    let id: ID?
//    let picture: Picture?
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try? container.decode(NameClass.self, forKey: .name)
    }
}

enum Gender: String, Codable {
    case female
    case male
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

struct Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?
}

struct ID: Codable {
    let name: NameEnum?
    let value: String?
}

enum NameEnum: String, Codable {
    case avs = "AVS"
    case bsn = "BSN"
    case cpr = "CPR"
    case dni = "DNI"
    case empty = ""
    case fn = "FN"
    case hetu = "HETU"
    case insee = "INSEE"
    case nino = "NINO"
    case pps = "PPS"
    case ssn = "SSN"
    case tfn = "TFN"
}

struct Picture: Codable {
    let large, medium, thumbnail: String?
}
