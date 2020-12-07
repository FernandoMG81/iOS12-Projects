//
//  SecondViewController.swift
//  coding
//
//  Created by Fernando Martin Gordillo on 01/12/2020.
//

import UIKit

class SecondViewController: UIViewController {
    
    var fibonacci : [Int] = [0,1]
    var fibID = 1

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    func generateFibNumbers (){
        if self.fibID <= 1 || self.fibID >= 100{
            return
        }
        
        self.fibonacci = [0,1]
        
        for i in 2...self.fibID {
            self.fibonacci.append(self.fibonacci[i-1] + self.fibonacci[i-2])
        }
        
        print(fibonacci)
    }
    

}
