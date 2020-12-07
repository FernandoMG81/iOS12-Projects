//
//  FirstViewController.swift
//  coding
//
//  Created by Fernando Martin Gordillo on 01/12/2020.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var labelAge: UITextField!
    @IBOutlet weak var sliderAge: UISlider!
    
    var userAge = -1
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sliderAge.value = 18
        self.updateAgeLabels()
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //cerramos el teclado
        textField.resignFirstResponder()
        
        //recuperamos el texto del textfield si existe
        if let theText = textField.text{
            print(theText)
            self.userName = theText
        }
        
        //indicamos la finalizacion de la edicion del textfield
        return true
    }
    
    
    @IBAction func sliderAgeMoved(_ sender: UISlider) {
        
        self.updateAgeLabels()
    }
    
    func updateAgeLabels (){
        self.userAge = Int(self.sliderAge.value)
        self.labelAge.text = "\(self.userAge)"
    }
    
    @IBAction func buttonValidateData(_ sender: Any) {
        
        let shouldEnterTheParty = (self.userName == "Fernando") || (self.userAge >= 18)
        
        if shouldEnterTheParty{
            self.view.backgroundColor = UIColor(red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        }else{
            self.view.backgroundColor = UIColor(red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255/0, alpha: 0.8)
        }
        
        
        
        /*
          if self.userName == "Fernando"{
            self.view.backgroundColor = UIColor(red: 49.0/255.0, green: 237.0/255.0, blue: 93.0/255.0, alpha: 0.7)
        } else {
            if self.userAge >= 18{
                self.view.backgroundColor = UIColor(red: 50.0/255.0, green: 160.0/255.0, blue: 250.0/255.0, alpha: 0.7)
            } else {
                self.view.backgroundColor = UIColor(red: 250.0/255.0, green: 50.0/255.0, blue: 50.0/255/0, alpha: 0.8)
            }
        }
        */
    }
    

}
