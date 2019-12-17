//
//  EpisodesAPIClient.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/16/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct EpisodesAPIClient{
    
    static func getEpisodes(for showId: Int, completion: @escaping (Result<[EpisodesDataLoad], AppError>) -> ()) {
        
        let episodeEndPointString = "http://api.tvmaze.com/shows/\(showId)/episodes"
        
        guard let url = URL(string: episodeEndPointString) else {
            completion(.failure(.badURL(episodeEndPointString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                
                do{
                    let episodes = try JSONDecoder().decode([EpisodesDataLoad].self, from: data)
                    
                    completion(.success(episodes))
                }catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
