//
//  FirstViewController.swift
//  QuizApp
//
//  Created by Fernando Martin Gordillo on 15/03/2021.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var labelTopic: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var questionTopic : [String] = []
    var factory = QuestionsFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.dataSource = self
//        tableView.delegate = self
        
        self.getTopicList() //Obtener listado de temas
        print(questionTopic)
    }
    

    //recorrer la question.plist para obtener los temas de las preguntas
    func getTopicList (){
        for top in self.factory.questionsBank.questions {
            self.questionTopic.append(top.topic)
            
            self.questionTopic = self.questionTopic.removeDuplicates()
        }
    }
//    MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showQuestionsForTopic"{
            let destinationVC = segue.destination as! ViewController
            let idx = self.tableView.indexPathForSelectedRow!.row
            destinationVC.topicQuestion = self.questionTopic[idx]
            destinationVC.modalPresentationStyle = .fullScreen
        }
    }
    
//    MARK: - Métodos del protocolo UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionTopic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicCell", for: indexPath)
        
        cell.textLabel?.text = self.questionTopic[indexPath.row]
        cell.textLabel?.textAlignment = .center
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.backgroundColor = .cyan
        case 1:
            cell.textLabel?.backgroundColor = .red
        case 2:
            cell.textLabel?.backgroundColor = .green
        default:
            cell.textLabel?.backgroundColor = .darkGray
        }
        
        return cell
    }
    
    //MARK - Métodos del protocolo UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let qTopic = self.questionTopic[row]
        print("qtopic: \(qTopic)")
    
    }
}

//Quitar los duplicados del array
extension Array where Element: Hashable {
func removeDuplicates() -> [Element] {
    var addedDict = [Element: Bool]()

    return filter {
        addedDict.updateValue(true, forKey: $0) == nil
    }
    }
}
