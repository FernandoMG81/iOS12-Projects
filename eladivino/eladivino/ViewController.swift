//
//  ViewController.swift
//  eladivino
//
//  Created by Fernando Martin Gordillo on 29/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelAswer: UILabel!
    
    let answersArray: [String]
    var randomAsnwerNumber : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        answersArray = ["Si","No","Es muy posible", "Puede ser", "Ni lo sueñes", "No tienes oportunidad","Mejor pregunta otra cosa"]
        randomAsnwerNumber = UInt32(answersArray.count)
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        labelAswer.text = ""
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        generateRandomAnswer()
    }
    
    func generateRandomAnswer (){
        labelAswer.text = answersArray[Int(arc4random_uniform(randomAsnwerNumber))]
    }
    
}

