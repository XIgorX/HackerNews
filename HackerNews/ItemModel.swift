//
//  ItemModel.swift
//  HackerNews
//
//  Created by Igor Danilchenko on 25/03/2020.
//  Copyright © 2020 Igor Danilchenko. All rights reserved.
//

import UIKit

struct Item : Decodable {
    
    var by : String?
    var descendants : Int?
    var id : Int?
    var kids : [Int]?
    var score : Int?
    var time : Date?
    var title : String?
    var type : String?
    var url : String?

}

struct ArrayOfIDs : Decodable {
    
    var list : [Int]
    
}
