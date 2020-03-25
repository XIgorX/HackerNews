//
//  ViewController.swift
//  HackerNews
//
//  Created by Igor Danilchenko on 25/03/2020.
//  Copyright © 2020 Igor Danilchenko. All rights reserved.
//

import UIKit

let cellHeight : CGFloat = 120

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items : [Item] = []
    var currentIndexPath : IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    func loadData() {
        self.items = []
        let manager = NetworkManager()
        manager.getIDsFor(category: "newstories") { (ids) in
            for id in ids {
                manager.getItem(id: id, completion: { [weak self] item in
                    self?.items.append(item)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                })
            }
            // try Dispatch Group?
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WebViewController
        {
            if let currentIndexPath = currentIndexPath
            {
                vc.urlString = items[currentIndexPath.row].url
            }
        }
    }
}

