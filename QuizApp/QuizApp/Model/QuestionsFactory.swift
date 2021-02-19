//
//  QuestionsFactory.swift
//  QuizApp
//
//  Created by Fernando Martin Gordillo on 19/02/2021.
//

import Foundation

class QuestionsFactory {
    
    var questions = [Question]()
    
    
    init() {
        
                
        questions.append(Question(text: "", correctAnswer: true))
                
        questions.append(Question(text: "", correctAnswer: false))
                
        questions.append(Question(text: "", correctAnswer: true))
                
        questions.append(Question(text: "", correctAnswer: false))
                
        questions.append(Question(text: "", correctAnswer: false))
         
        questions.append(Question(text: "", correctAnswer: true))
                
        questions.append(Question(text: "", correctAnswer: true))
                
        questions.append(Question(text: "", correctAnswer: true))
                
        questions.append(Question(text: "", correctAnswer: false))
                
        questions.append(Question(text: "", correctAnswer: true))
                
        questions.append(Question(text: "", correctAnswer: true))
         
        questions.append(Question(text: "", correctAnswer: true))
         
        questions.append(Question(text: "", correctAnswer: false))
         
        questions.append(Question(text: "", correctAnswer: true))
         
        questions.append(Question(text: "", correctAnswer: true))
         
        questions.append(Question(text: "", correctAnswer: true))
         
        questions.append(Question(text: "", correctAnswer: true))
         
        questions.append(Question(text: "", correctAnswer: true))
         
        questions.append(Question(text: "", correctAnswer: true))
        
        
    }
    
    
    func getQuestionAt(index: Int) -> Question?{
        if index < 0 || index > questions.count{
            return nil
        }
        else{
            return questions[index]
        }
    }
    
    func getRandomQuestion() -> Question {
        let index = Int(arc4random_uniform(UInt32(questions.count)))
        return questions[index]
    }
    
}
