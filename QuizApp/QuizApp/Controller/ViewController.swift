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
    
    var currentScore = 0
    var currentQuestionID = 0
    var correctQuestionAnswered = 0
    var currentQuestion : Question!
    let factory = QuestionsFactory()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame()
     
    }
    
    func startGame() {
        currentScore = 0
        currentQuestionID = 0
        correctQuestionAnswered = 0
        
        //Metodo para mezclar las preguntas
        self.factory.questionsBank.questions.shuffle()
        askNextQuestion()
    }
    
    func askNextQuestion() {
        if let newQuestion = factory.getQuestionAt(index: currentQuestionID){
            self.currentQuestion = newQuestion
            labelQuestion.text = self.currentQuestion.question
            self.currentQuestionID+=1
        }else{
            gameOver()
        }
        
    }
    
    func gameOver(){
        //metodo para cuando no hay mas preguntas
    }


    @IBAction func buttonPress(_ sender: UIButton) {
        var isCorrect : Bool
        if sender.tag == 1{
            //el usuario a cliqueado el verdadero
            isCorrect = (self.currentQuestion.answer == true)
        }else{
            //el usuario a cliqueado el falso
            isCorrect = (self.currentQuestion.answer == false)
        }
        
        if isCorrect{
            self.correctQuestionAnswered += 1
        }
        
        askNextQuestion()
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

