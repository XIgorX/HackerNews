//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Igor Danilchenko on 25/03/2020.
//  Copyright © 2020 Igor Danilchenko. All rights reserved.
//

import UIKit

class NetworkManager {
    
    let baseURL = "https://hacker-news.firebaseio.com/v0/"

    func getItem(id: Int, completion: @escaping (Item) -> Void) {

        if let url = URL(string: "\(baseURL)item/\(id).json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let item: Item = try? JSONDecoder().decode(Item.self, from: data)
                    {
                        completion(item)
                    }
                }
                }.resume()
        }
        
    }
    
    func getIDsFor(category: String, completion: @escaping ([Int]) -> Void) {
        
        if let url = URL(string: "\(baseURL)\(category).json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let ids: [Int] = try! JSONDecoder().decode([Int].self, from: data)
                    completion(ids)
                }
                }.resume()
        }
        
    }

}
