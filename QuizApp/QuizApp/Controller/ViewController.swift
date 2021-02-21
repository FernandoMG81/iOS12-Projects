//
//  ViewController.swift
//  QuizApp
//
//  Created by Fernando Martin Gordillo on 17/02/2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var labelQuestionNumber: UILabel!
    
    @IBOutlet weak var labelScore: UILabel!
    
    @IBOutlet weak var progressBar: UIView!
    
    var currentScore = 0
    var currentQuestionID = 0
    var correctQuestionAnswered = 0
    var currentQuestion : Question!
    var factory = QuestionsFactory()
    var audioPlayer : AVAudioPlayer!
    let limitQuestions = 10

    
    
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
        let totalQuestions = self.factory.questionsBank.questions.count
        self.factory.questionsBank.questions.removeLast(totalQuestions - limitQuestions)
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
        let alert = UIAlertController(title: NSLocalizedString("game.over.title", comment: "Titulo del pop up del game over"), message: "\(NSLocalizedString("game.over.message1", comment: "")) \(self.correctQuestionAnswered) / \(self.currentQuestionID). \(NSLocalizedString("game.over.message2", comment: ""))", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.startGame()
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func updateUIElement(){
        self.labelScore.text = "\(NSLocalizedString("score.text", comment: "")) \(self.currentScore)"
        self.labelQuestionNumber.text = "\(self.currentQuestionID) / \(self.factory.questionsBank.questions.count)"
        
        for constraint in self.progressBar.constraints {
            if constraint.identifier == "barWidth"{
                constraint.constant = self.view.frame.size.width/CGFloat(self.factory.questionsBank.questions.count)*CGFloat(self.currentQuestionID)
            }
        }
        
    }
    
    func playSound(correct : Bool) {
        
        if correct{
            if let soundURL : URL = Bundle.main.url(forResource: sounds.correct.rawValue, withExtension: "mp3"){
                do {
                    self.audioPlayer = try AVAudioPlayer.init(contentsOf: soundURL)
                } catch {
                    print(error)
                }
                audioPlayer.play()
            }
        }else{
            if let soundURL : URL = Bundle.main.url(forResource: sounds.wrong.rawValue, withExtension: "mp3"){
                do {
                    self.audioPlayer = try AVAudioPlayer.init(contentsOf: soundURL)
                } catch {
                    print(error)
                }
                audioPlayer.play()
            }
        }
    }


    @IBAction func buttonPress(_ sender: UIButton) {
        
        /*if let soundURL : URL = Bundle.main.url(forResource: fileName, withExtension: "mp3"){
        do {
            audioPlayer1 = try AVAudioPlayer.init(contentsOf: soundURL)
         } catch{
            print(error)
        }
            audioPlayer1.play()
            audioPlayer1.volume = self.volumeSlider.value
            audioPlayer1.isMeteringEnabled = true
            audioPlayer1.updateMeters()
            decibelsLabel.text = ("\(audioPlayer1.averagePower(forChannel: 0))Db")
            print(audioPlayer1.volume)
        }*/
        var isCorrect : Bool
        if sender.tag == 1{
            //el usuario a cliqueado el verdadero
            isCorrect = (self.currentQuestion.answer == true)
        }else{
            //el usuario a cliqueado el falso
            isCorrect = (self.currentQuestion.answer == false)
        }
        
        //var title = "Has fallado =("
        
        if isCorrect{
            self.correctQuestionAnswered += 1
            //title = "Enhorabuena !"
            self.currentScore += 100*self.correctQuestionAnswered
            ProgressHUD.showSucceed("\(NSLocalizedString("question.ok", comment: ""))\n\(self.currentQuestion.explanation)")
            playSound(correct: true)
        }else{
            ProgressHUD.showError("\(NSLocalizedString("question.ko", comment: ""))\n\(self.currentQuestion.explanation)")
            playSound(correct: false)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.askNextQuestion()
            self.updateUIElement()
        }
        
        
        //ALERTAS VIEJAS
        /*
        let alert = UIAlertController(title: title, message: self.currentQuestion.explanation, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            self.askNextQuestion()
            self.updateUIElement()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        */
        
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

enum sounds : String{
    case correct = "correct"
    case wrong = "wrong"
}
