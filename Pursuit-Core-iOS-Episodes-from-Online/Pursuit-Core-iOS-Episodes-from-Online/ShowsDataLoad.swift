//
//  ShowsDataLoad.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowsDataLoad: Decodable {
    let show: Name
    let rating: Rating
    let image: Images
    let summary: String
}

struct Name: Decodable {
    let name: String
}

struct Rating: Decodable {
    let average: Double
}

struct Images: Decodable {
    let medium: String
    let original: String
}
