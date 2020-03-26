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
    
    var category : String = "beststories"
    
    var items : [Item] = []
    var itemsBest : [Item] = []
    var itemsTop : [Item] = []
    var itemsNew : [Item] = []
    
    var currentIndexPath : IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        defineCategory()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        items = []
        tableView.dataSource = nil
        tableView.delegate = nil
    }
    
    func defineCategory() {
        
        switch self.navigationController?.restorationIdentifier {
        case "navigationBest":
            category = "beststories"
            items = itemsBest
        case "navigationTop":
            category = "topstories"
            items = itemsTop
        case "navigationNews":
            category = "newstories"
            items = itemsNew
        default:
            break
        }
        
        tableView.reloadData()
        
    }
    
    func loadData() {
        let manager = NetworkManager()
        manager.getIDsFor(category: category) { (ids) in
            self.items = []
            self.itemsBest = []
            self.itemsTop = []
            self.itemsNew = []
            for id in ids {
                manager.getItem(id: id, completion: { [weak self] item in
                    self?.items.append(item)
                    DispatchQueue.main.sync {
                        self?.tableView.reloadData()
                    }
                    // saving to cache arrays
                    switch self?.category {
                        case "beststories":
                            self?.itemsBest.append(item)
                        case "topstories":
                            self?.itemsTop.append(item)
                        case "newstories":
                            self?.itemsNew.append(item)
                        default:
                            break
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

