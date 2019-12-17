//
//  EpisodesCell.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodesCell: UITableViewCell {
    
    @IBOutlet weak var episodeImageView: UIImageView!
    
    @IBOutlet weak var episodeName: UILabel!
    
    @IBOutlet weak var episodeDetail: UILabel!
    
    
    func configureCell(for episodes: EpisodesDataLoad) {
        
        episodeName.text = episodes.name
        episodeDetail.text = "Season: \(episodes.season) Episode \(episodes.number)"
        
        episodeImageView.getImage(with: episodes.image?.medium ?? "https://i5.walmartimages.com/asr/f678f030-7c05-456c-875c-902838795d1f_1.d86e9b52a1cecafe7b2e178383c20c44.jpeg") { (result) in
            
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
                DispatchQueue.main.async {
                    self.episodeImageView.image = UIImage(systemName: "exclamationmark.triangle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                self.episodeImageView.image = image
                }
            }
        }
    }
}
