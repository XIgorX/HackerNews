//
//  ViewController+TableViewDatasource.swift
//  HackerNews
//
//  Created by Igor Danilchenko on 25/03/2020.
//  Copyright © 2020 Igor Danilchenko. All rights reserved.
//

import UIKit

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as? HackerNewsCell
        {
            
            cell.labelNumber.text = String(indexPath.row + 1)
            cell.labelTitle?.numberOfLines = 0
            cell.labelTitle?.text = self.items[indexPath.row].title
            cell.labelURL?.text = self.items[indexPath.row].url
            let date = Date(timeIntervalSince1970: Double(self.items[indexPath.row].time!))
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd"
            let dateString = df.string(from: date)
            cell.labelDate.text = dateString
        
            return cell
        }
        
        return UITableViewCell()
    }
}
