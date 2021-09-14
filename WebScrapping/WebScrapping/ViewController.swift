//
//  ViewController.swift
//  WebScrapping
//
//  Created by Fernando Martin Gordillo on 01/09/2021.
//

import UIKit
import Alamofire
import Kanna


class ViewController: UIViewController {
    
    
    let urlName = "https://www.apple.com/itunes/charts/songs/"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrapeURL()
        
    }

    func scrapeURL(){
        AF.request(urlName).responseString { response in
            print(response.result)
        }
    }

}

