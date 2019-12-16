//
//  ViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ShowsViewController: UIViewController {

    @IBOutlet weak var showsTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var shows = [ShowsDataLoad](){
        didSet {
            DispatchQueue.main.async {
                self.showsTableView.reloadData()
            }
        }
    }
    
    var searchQuery = "" {
        didSet {
            self.searchBarQuery()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showsTableView.dataSource = self
        showsTableView.delegate = self
        loadData(for: "")
        searchBar.delegate = self
    }

    func loadData(for showSearch: String) {
        
        
        ShowsAPIClient.getShows(for: showSearch) { (result) in
            
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let shows):
                self.shows = shows
                dump(shows)
            }
        }
    }
    
    func searchBarQuery() {
        print(searchQuery.lowercased())
        shows = shows.filter{ ($0.show.name.lowercased().contains(searchQuery.lowercased()))}
    }

}

extension ShowsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "showsCell", for: indexPath) as? ShowsCell else {
            fatalError("didn't conform to custom cell")
        }
        let selectedShow = shows[indexPath.row]
            
        cell.configureCell(for: selectedShow)
            
        return cell
        }
}

extension ShowsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if !searchText.isEmpty {
            loadData(for: searchText)
        }
        searchQuery = searchText
    }
}
