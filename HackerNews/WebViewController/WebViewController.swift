//
//  WebViewController.swift
//  HackerNews
//
//  Created by Igor Danilchenko on 26/03/2020.
//  Copyright © 2020 Igor Danilchenko. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlString : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let urlString = urlString
        {
            if let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
        
    }

}
