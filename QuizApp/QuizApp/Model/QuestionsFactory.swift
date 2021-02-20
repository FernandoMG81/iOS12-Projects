//
//  QuestionsFactory.swift
//  QuizApp
//
//  Created by Fernando Martin Gordillo on 19/02/2021.
//

import Foundation

class QuestionsFactory {
    
    var questionsBank : QuestionsBank!
    
    
    init() {
        //PROCESADO MANUAL DE PLIST
        /*
        if let path = Bundle.main.path(forResource: "QuestionsBank", ofType: "plist"){
            if let plist = NSDictionary(contentsOfFile: path){
                let questionData = plist["questions"] as! [AnyObject]
                
                for question in questionData{
                    if let text = question["question"], let ans = question["answer"], let expl = question["explanation"]{
                        questions.append(Question(text: text as! String, correctAnswer: ans as! Bool, answer: expl as! String))
                    }
                }
            }
        }*/
        
        //PROCESADO CON CODABLE
        
        do {
            if let url = Bundle.main.url(forResource: "QuestionsBank", withExtension: "plist"){
                let data = try Data(contentsOf: url)
                self.questionsBank = try PropertyListDecoder().decode(QuestionsBank.self, from: data)
                
            }
        } catch {
            print(error)
        }
        
    }
    
    
    func getQuestionAt(index: Int) -> Question?{
        if index < 0 || index > self.questionsBank.questions.count{
            return nil
        }
        else{
            return self.questionsBank.questions[index]
        }
    }
    
    func getRandomQuestion() -> Question {
        let index = Int(arc4random_uniform(UInt32(self.questionsBank.questions.count)))
        return self.questionsBank.questions[index]
    }
    
}
