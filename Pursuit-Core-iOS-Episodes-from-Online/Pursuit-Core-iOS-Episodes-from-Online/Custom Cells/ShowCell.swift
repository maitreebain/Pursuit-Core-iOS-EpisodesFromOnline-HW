//
//  ShowCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/12/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowsCell: UITableViewCell {
    
    @IBOutlet weak var showImage: UIImageView!
    
    @IBOutlet weak var showName: UILabel!
    
    
    func configureCell(for shows: ShowsDataLoad) {
        
        showName.text = shows.show.name
        
//
//        ShowsAPIClient.getShows(for: shows.image.medium) { [weak self] (result) in
//
//            switch result{
//            case .failure(let appError):
//                print("app Error: \(appError)")
////                DispatchQueue.main.async {
////                    self?.showImage.image = UIImage(systemName: "exclamationmark.triangle")
////                }
//            case .success(<#T##[ShowsDataLoad]#>)
//        }
//
        
        
        guard let url = URL(string: shows.image.medium) else {
            print("no show url found")
            return
        }

        let request = URLRequest(url: url)

        NetworkHelper.shared.performDataTask(with: request) { [weak self] (result) in

            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let data):
                self?.showImage.image = UIImage(data: data)
            }
        }
    }
}
