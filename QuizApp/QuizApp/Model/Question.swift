//
//  Question.swift
//  QuizApp
//
//  Created by Fernando Martin Gordillo on 19/02/2021.
//

import Foundation


class Question : CustomStringConvertible {
    let questionText : String
    let answer: Bool
//    let answerExplanation : String
    
    //Variable que sobreescribimos para darle formato cuando se imprimi
    //Hay que agregar el protocolo CustomStringConvertible
    var description : String {
        let respuesta = (answer ? "Verdadera" : "Falsa")
        return """
            Pregunta:
                - \(questionText)
                - Respuesta : \(respuesta)
        """
    }
    
    init(text : String, correctAnswer : Bool/*, answer:String*/) {
        self.questionText = text
        self.answer = correctAnswer
//        self.answerExplanation = answer
    }
}