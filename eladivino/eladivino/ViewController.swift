//
//  ViewController.swift
//  eladivino
//
//  Created by Fernando Martin Gordillo on 29/11/2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewAnswers: UIImageView!
    
    let answersArray: [String]
    var randomAsnwerNumber : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        answersArray = ["BubbleNiLoSuenes","BubbleNo","BubbleNunca", "BubbleOportunidad", "BubbleOtraPregunta", "BubblePosible","BubbleSi"]
        randomAsnwerNumber = UInt32(answersArray.count)
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        generateRandomAnswer()
    }
    
    func generateRandomAnswer (){
        //labelAswer.text = answersArray[Int(arc4random_uniform(randomAsnwerNumber))]
        
        UIView.animate(withDuration: 1, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.imageViewAnswers.transform = CGAffineTransform.init(scaleX: 0.2, y: 0.2)
        }) { (completed) in
            
            self.imageViewAnswers.transform = CGAffineTransform.identity
            
            self.imageViewAnswers.image = UIImage(named: self.answersArray[Int(arc4random_uniform((self.randomAsnwerNumber)))])        }
        
        
        
    }
    
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            
        if motion == .motionShake{
            generateRandomAnswer()
        }
    }
}

