//
//  AppError.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

enum AppError: Error {
case badURL(String)
case noResponse
case networkClientError(Error)
case noData
case decodingError(Error)
case encodingError(Error)
case badStatusCode(Int)
case badMimeType(String)
}
