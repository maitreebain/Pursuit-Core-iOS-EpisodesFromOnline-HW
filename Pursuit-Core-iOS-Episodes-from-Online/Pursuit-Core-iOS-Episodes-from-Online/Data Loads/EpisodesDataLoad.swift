//
//  EpisodesDataLoad.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct EpisodesDataLoad: Decodable {
    let id: Int
    let name: String
    let season: Int
    let number: Int
    let image: Image?
    let summary: String
    var cleanSummary: String {
        return summary.replacingOccurrences(of: "<p>", with: " ").replacingOccurrences(of: "</p>", with: " ")
    }
}

struct Image: Decodable {
    let medium: String
    let original: String
}
