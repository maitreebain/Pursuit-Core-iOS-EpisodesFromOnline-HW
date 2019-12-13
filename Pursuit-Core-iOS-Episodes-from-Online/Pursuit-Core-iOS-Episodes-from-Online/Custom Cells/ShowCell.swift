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
        
        guard let url = URL(string: shows.image.medium) else {
            print("no show url found")
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let data):
                
            }
        }
    }
}
