//
//  Question.swift
//  QuizApp
//
//  Created by Fernando Martin Gordillo on 19/02/2021.
//

import Foundation


class Question : CustomStringConvertible, Codable {
    let question : String
    let answer: Bool
    let explanation : String
    let image : String
    
    //Se genera para linkear los nombres de los campos en la questionList
    //si son distintos, si son iguales no es necesario
    /*enum CodingKeys : String, CodingKey {
        case questionText = "question"
        case answer = "answer"
        case answerExplanation = "explanation"
    }*/
    
    
    //Variable que sobreescribimos para darle formato cuando se imprimi
    //Hay que agregar el protocolo CustomStringConvertible
    var description : String {
        let respuesta = (answer ? "Verdadera" : "Falsa")
        return """
            Pregunta:
                - \(question)
                - Respuesta: \(respuesta)
                - Explicación: \(explanation)
        """
    }
    
    init(text : String, correctAnswer : Bool, answer:String, image : String) {
        self.question = text
        self.answer = correctAnswer
        self.explanation = answer
        self.image = image
    }
}

struct QuestionsBank : Codable {
    var questions : [Question]
}
