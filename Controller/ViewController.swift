//
//  ViewController.swift
//  iamrich
//
//  Created by Fernando Martin Gordillo on 24/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    //Propertys
    
    @IBOutlet weak var labelTittle: UILabel!
    @IBOutlet weak var imageViewRuby: UIImageView!
    @IBOutlet weak var buttonPush: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

//Methods
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let controller = UIAlertController(title: "I am rich", message: """
            I am rich,
            I deserve it,
            I am good,
            healthy and successful
            """, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Aceptar", style: .default) { (action) in
            print("He apretado el botón aceptar")
        }
    
        controller.addAction(action)
        
        let action2 = UIAlertAction(title: "Borrar", style: .destructive, handler: { (action) in
            print("He apretado el botón Borrar")
        })
    
        controller.addAction(action2)
        
        let action3 = UIAlertAction(title: "Cancelar", style: .cancel){ _ in
            print("He apretado el botón Cancelar")
        }
    
        controller.addAction(action3)
        
        self.show(controller, sender: nil)
    }
    
    
}

