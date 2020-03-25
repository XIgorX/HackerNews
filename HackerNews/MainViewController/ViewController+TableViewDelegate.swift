//
//  ViewController+TableViewDelegate.swift
//  HackerNews
//
//  Created by Igor Danilchenko on 26/03/2020.
//  Copyright © 2020 Igor Danilchenko. All rights reserved.
//

import UIKit

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentIndexPath = indexPath
        performSegue(withIdentifier: "show_story", sender: self)
    }
    
}
