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
        
        questions.append(Question(text: "El Vaticano tiene la cantidad de dinero suficiente para acabar con la pobreza mundial dos veces", correctAnswer: true))
                
        questions.append(Question(text: "El caballito de mar es tan fiel a su pareja, que cuando uno muere, el otro también lo hace al poco tiempo", correctAnswer: true))
                
        questions.append(Question(text: "Los humanos son los únicos seres vivos que practican el sexo por placer", correctAnswer: false))
                
        questions.append(Question(text: "La semilla de la manzana contiene cianuro y es tóxica", correctAnswer: true))
                
        questions.append(Question(text: "Se puede afeitar el bigote a un gato sin ningún problema", correctAnswer: false))
                
        questions.append(Question(text: "Un Koala necesita beber al menos una vez al día", correctAnswer: false))
         
        questions.append(Question(text: "Edison, el inventor de la bombilla, temía a la oscuridad", correctAnswer: true))
                
        questions.append(Question(text: "Los escorpiones son los únicos animales que se suicidan cuando no pueden escapar de una situación de peligro", correctAnswer: true))
                
        questions.append(Question(text: "Los ojos de un hamster se pueden caer si se le cuelga cabeza abajo", correctAnswer: true))
                
        questions.append(Question(text: "Si divides el número de abejas hembra entre el de abejas macho de un panal, se obtiene el número de oro", correctAnswer: false))
                
        questions.append(Question(text: "Las palmeras nacieron por primera vez en el polo norte", correctAnswer: true))
                
        questions.append(Question(text: "Cervantes y Shakespeare murieron el mismo día", correctAnswer: true))
         
        questions.append(Question(text: "Los mosquitos tienen dientes", correctAnswer: true))
         
        questions.append(Question(text: "Los ojos humanos son de diferente tamaño", correctAnswer: false))
         
        questions.append(Question(text: "Una gota de petróleo puede convertir 25L de agua potable en no potable", correctAnswer: true))
         
        questions.append(Question(text: "Los osos polares son zurdos", correctAnswer: true))
         
        questions.append(Question(text: "Un metro cuadrado de césped produce suficiente oxigeno para una persona por todo el año", correctAnswer: true))
         
        questions.append(Question(text: "El yoyo primero se uso como arma en Asia", correctAnswer: true))
         
        questions.append(Question(text: "La base de la Gran Pirámide de Egipto equivale en tamaño a 10 campos de fútbol", correctAnswer: true))
         
        questions.append(Question(text: "Cada vez que Beethoven se sentaba a escribir música, se ponía agua fría sobre la cabeza", correctAnswer: true))
        
        
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
