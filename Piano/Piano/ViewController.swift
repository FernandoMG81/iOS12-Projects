//
//  ViewController.swift
//  Piano
//
//  Created by Fernando Martin Gordillo on 10/12/2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer1 : AVAudioPlayer!
    var audioPlayer2 : AVAudioPlayer!
    var channel = true
    let soundsArray = ["c1","c1s","d1","d1s","e1","f1","f1s","g1","g1s","a1","a1s","b1","c2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playSound(_ sender: UIButton) {
    
        let idKey = sender.tag
        let fileName = self.soundsArray[idKey - 1]
        
        if let soundURL : URL = Bundle.main.url(forResource: fileName, withExtension: "mp3"){
        do {
            if channel{
                audioPlayer1 = try AVAudioPlayer.init(contentsOf: soundURL)
                channel = false
            } else {
                audioPlayer2 = try AVAudioPlayer.init(contentsOf: soundURL)
                channel = true
            }
         } catch{
            print(error)
        }
            if !channel{
                audioPlayer1.play()
            } else {
                audioPlayer2.play()
            }
            
        }
    }
    

}

