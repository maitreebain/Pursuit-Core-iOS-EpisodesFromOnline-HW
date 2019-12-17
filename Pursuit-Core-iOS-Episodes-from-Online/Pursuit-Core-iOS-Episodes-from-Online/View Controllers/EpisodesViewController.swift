//
//  EpisodesViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Maitree Bain on 12/13/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    @IBOutlet weak var episodesTableView: UITableView!
    
    var shows: ShowsDataLoad?
    
    var episodesData = [EpisodesDataLoad]() {
        didSet {
            DispatchQueue.main.async {
                self.episodesTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        episodesTableView.dataSource = self
        episodesTableView.delegate = self
        loadData(for: (shows?.show.id)!)
    }
    
    func loadData(for showId: Int) {
        
        EpisodesAPIClient.getEpisodes(for: showId) { (result) in
            
            switch result{
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let episodes):
                self.episodesData = episodes
            }
        }
    }
    
}

extension EpisodesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodesCell", for: indexPath) as? EpisodesCell else {
            fatalError("episode cell not connected")
        }
        
        let selectedEpisode = episodesData[indexPath.row]
        
        cell.configureCell(for: selectedEpisode)
        
        return cell
    }
}
