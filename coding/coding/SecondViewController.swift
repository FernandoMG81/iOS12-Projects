//
//  SecondViewController.swift
//  coding
//
//  Created by Fernando Martin Gordillo on 01/12/2020.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelNumber: UILabel!
    
    @IBOutlet weak var textViewResult: UITextView!
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var labelGoldNum: UILabel!
    
    var fibonacci : [Int] = [0,1]
    var fibID = 1
    var wantsGoldNum = false

    override func viewDidLoad() {
        super.viewDidLoad()

        updateLabel(id: Int(self.stepper.value))
    }
    
    func generateFibNumbers (){
        if self.fibID <= 1 || self.fibID >= 100{
            return
        }
        
        self.fibonacci = [0,1]
        
        for i in 2...self.fibID {
            self.fibonacci.append(self.fibonacci[i-1] + self.fibonacci[i-2])
        }
        
        let fibStr : [String] = fibonacci.compactMap({String($0)})
        let result = fibStr.joined(separator: "\n")
        self.textViewResult.text = result
    }
    
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        
        updateLabel(id: Int(sender.value))
        
    }
    
    @IBAction func switchMoved(_ sender: UISwitch) {
        self.wantsGoldNum = sender.isOn
        calculateGoldNum()
    }
    
    
    func updateLabel(id: Int){
        self.fibID = id
        self.labelNumber.text = "\(self.fibID)"
        self.generateFibNumbers()
        self.calculateGoldNum()
    }
    
    func calculateGoldNum(){
        if(wantsGoldNum){
            let last = Double(fibonacci[fibonacci.count-1])
            let previous = Double(fibonacci[fibonacci.count-2])
            let goldnum = last / previous
            self.labelGoldNum.text = "\(goldnum)"
        } else {
            self.labelGoldNum.text = "ver el número de oro"
        }

    }
}
