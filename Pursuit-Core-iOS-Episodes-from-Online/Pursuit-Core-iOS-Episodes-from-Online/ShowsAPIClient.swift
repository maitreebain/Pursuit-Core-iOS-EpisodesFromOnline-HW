//
//  ShowsAPIClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowsAPIClient {
    
    static func getShows(for showSearch: String, completion: @escaping (Result<[ShowsDataLoad], AppError>) -> ()) {
    
        let showsEndPointURL = "http://api.tvmaze.com/search/shows?q=\(showSearch)"
        
        guard let url = URL(string: showsEndPointURL) else {
            completion(.failure(.badURL(showsEndPointURL)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                
                do {
                    let shows = try JSONDecoder().decode([ShowsDataLoad].self, from: data)
                    completion(.success(shows))
                }
                catch {
                    completion(.failure(.decodingError(error)))
                }
                
                
            }
        }
        
    }
}
