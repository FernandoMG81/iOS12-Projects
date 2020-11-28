//
//  ViewController.swift
//  soypobre
//
//  Created by Fernando Martin Gordillo on 26/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelTittle: UILabel!
    @IBOutlet weak var imageViewPoor: UIImageView!
    @IBOutlet weak var buttonPush: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        makeMeRich()
    }
    
    func makeMeRich() -> Void {
        self.labelTittle.text = "SOY RICO"
        self.imageViewPoor.image = UIImage(named: "Rico")
    }
}

