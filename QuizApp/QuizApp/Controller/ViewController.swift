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
        updateUIElement()
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
        let alert = UIAlertController(title: "Fin de la partida", message: "Has acertado \(self.correctQuestionAnswered) / \(self.currentQuestionID)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.startGame()
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateUIElement(){
        self.labelScore.text = "Puntuación: \(self.currentScore)"
        self.labelQuestionNumber.text = "\(self.currentQuestionID) / \(self.factory.questionsBank.questions.count)"
        
        for constraint in self.progressBar.constraints {
            if constraint.identifier == "barWidth"{
                constraint.constant = self.view.frame.size.width/CGFloat(self.factory.questionsBank.questions.count)*CGFloat(self.currentQuestionID)
            }
        }
        
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
        
        var title = "Has fallado =("
        
        if isCorrect{
            self.correctQuestionAnswered += 1
            title = "Enhorabuena !"
            self.currentScore += 100*self.correctQuestionAnswered
        }
        
        let alert = UIAlertController(title: title, message: self.currentQuestion.explanation, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.askNextQuestion()
            self.updateUIElement()
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
        
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

