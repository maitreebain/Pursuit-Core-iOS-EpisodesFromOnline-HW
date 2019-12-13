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
    
    var shows = [ShowsDataLoad](){
        didSet {
            DispatchQueue.main.async {
                self.showsTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showsTableView.dataSource = self
        showsTableView.delegate = self
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
            
            let selectedShow = shows[indexPath.row]
            
            
            
            return cell
        }
    }
}
