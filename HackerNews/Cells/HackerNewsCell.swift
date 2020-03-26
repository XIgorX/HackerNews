//
//  HackerNewsCell.swift
//  HackerNews
//
//  Created by Igor Danilchenko on 26/03/2020.
//  Copyright © 2020 Igor Danilchenko. All rights reserved.
//

import UIKit

class HackerNewsCell: UITableViewCell {

    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelURL: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
