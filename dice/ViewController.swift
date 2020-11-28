//
//  ViewController.swift
//  dice
//
//  Created by Fernando Martin Gordillo on 28/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageViewDiceLeft: UIImageView!
    @IBOutlet weak var imageViewDiceRight: UIImageView!
    @IBOutlet weak var labelTotalDices: UILabel!
    
    //Variables globales
    var randomDiceIndexLeft : Int = 0
    var randomDiceIndexRight : Int = 0
    
    let diceImages : [String]
    let nFaces : UInt32
    
    //Inicializador de variables
    required init?(coder aDecoder: NSCoder) {
        diceImages = ["Dice1","Dice2","Dice3","Dice4","Dice5","Dice6"]
        nFaces = UInt32(diceImages.count)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //Acciones

    @IBAction func rollPressed(_ sender: UIButton) {
        generateRandomDices()
    }
    
    //Funciones
    func generateRandomDices (){
        
        randomDiceIndexLeft = Int(arc4random_uniform(nFaces))
        randomDiceIndexRight = Int(arc4random_uniform(nFaces))
        
        UIView.animate(withDuration: 0.5    ,
                       delay: 0,
                       options: UIView.AnimationOptions.curveEaseOut,
                       animations:{
                        
                        //Animacion de dados
                        self.imageViewDiceLeft.transform = CGAffineTransform(translationX: -20, y: 20).concatenating(CGAffineTransform(rotationAngle: 0.999 * .pi)).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                        
                        self.imageViewDiceRight.transform = CGAffineTransform(translationX: 20, y: 20).concatenating(CGAffineTransform(rotationAngle: -0.999 * .pi)).concatenating(CGAffineTransform(scaleX: 0.6, y: 0.6))
                        
        }) { (completed) in
            //Vuelven las imagenes a su estado original
            self.imageViewDiceLeft.transform = CGAffineTransform.identity
            self.imageViewDiceRight.transform = CGAffineTransform.identity
            
            self.imageViewDiceLeft.image = UIImage(named: self.diceImages[self.randomDiceIndexLeft])
            self.imageViewDiceRight.image = UIImage(named: self.diceImages[self.randomDiceIndexRight])
            
            self.sumDices(numero1: self.randomDiceIndexLeft + 1, numero2: self.randomDiceIndexRight + 1)
            print("n1: \(self.randomDiceIndexLeft + 1)")
            print("n2: \(self.randomDiceIndexRight + 1)")
        }

        
    }
    
    func sumDices(numero1: Int, numero2 : Int){
        
        let totalDices: Int = numero1 + numero2
        print("total: \(totalDices)")
        
        if totalDices < 10{
            labelTotalDices.text = "0\(totalDices)"
        }
        else{
            labelTotalDices.text = String(totalDices)
        }
        
        
    }
    
    
    
    //metodos shake
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            
        if motion == .motionShake{
            generateRandomDices()
        }
    }
    
}

