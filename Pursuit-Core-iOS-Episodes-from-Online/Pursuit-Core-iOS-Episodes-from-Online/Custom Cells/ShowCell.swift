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
        
        showImage.getImage(with: (shows.show.image?.medium ?? " ")) { (result) in
            
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
                DispatchQueue.main.async {
                    self.showImage.image = UIImage(systemName: "exclamationmark.triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self.showImage.image = image
                }
            }
        }
        
    }
}
