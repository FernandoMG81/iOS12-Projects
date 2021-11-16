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
    
    
    let urlName = "https://music.apple.com/us/browse/top-charts/songs"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        scrapeURL()
        
    }

    func scrapeURL(){
        AF.request(urlName).responseString { response in
            if case .success(let value) = response.result {
                    self.parseHTML(html: value)
            }
        }
    }
    func parseHTML(html: String){
        
        do{
            let doc = try Kanna.HTML(html: html, encoding: String.Encoding.utf8)
            print(doc.title)
            
            for div in doc.css("div"){
                if div["class"] == "songs-list-row__song-name"{
                    print(div.text)
                }
                if div["class"] == "songs-list-row__by-line"{
                    print(div.text)
                }
            }
            
//            for ul in doc.css("ul"){
//                print(ul.text)
//            }
            
            
        }catch{
            print(error)
        }
    }
}


