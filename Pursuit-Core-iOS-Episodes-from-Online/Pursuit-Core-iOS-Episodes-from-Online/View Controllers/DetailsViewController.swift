//
//  DetailsViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var episodeImage: UIImageView!
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var episodeLabel: UILabel!
    
    @IBOutlet weak var episodeTextView: UITextView!
    
    var episodes: EpisodesDataLoad?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData(for: episodes!)
    }
    
    func loadData(for episode: EpisodesDataLoad) {
        
        episodeNameLabel.text = episode.name
        episodeLabel.text = "Episode: \(episode.number)"
        seasonLabel.text = "Season: \(episode.season)"
        episodeTextView.text = episode.cleanSummary

        episodeImage.getImage(with: episode.image?.original ?? "https://i5.walmartimages.com/asr/f678f030-7c05-456c-875c-902838795d1f_1.d86e9b52a1cecafe7b2e178383c20c44.jpeg" ) { (result) in
                    
                    switch result{
                    case .failure(let appError):
                        print("appError: \(appError)")
                        DispatchQueue.main.async {
                            self.episodeImage.image = UIImage(systemName: "exclamationmark.triangle")
                        }
                    case .success(let image):
                        DispatchQueue.main.async {
                        self.episodeImage.image = image
                        }
                    }
                }
            }
        }
