//
//  ViewController.swift
//  QuizApp
//
//  Created by Fernando Martin Gordillo on 17/02/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var labelQuestionNumber: UILabel!
    
    @IBOutlet weak var labelScore: UILabel!
    
    @IBOutlet weak var progressBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        
        
    }


    @IBAction func buttonPress(_ sender: UIButton) {
        let factory = QuestionsFactory()
        let questions = factory.getRandomQuestion()
        labelQuestion.text = "\(questions)"
    }
    
    //setear el color de la barra de estado
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
    //esconder la barra de estado
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
}

