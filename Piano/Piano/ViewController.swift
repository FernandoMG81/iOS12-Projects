//
//  ViewController.swift
//  Piano
//
//  Created by Fernando Martin Gordillo on 10/12/2020.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var decibelsLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    var audioPlayer1 : AVAudioPlayer!
    var channel = true
    let soundsArray = ["c1","c1s","d1","d1s","e1","f1","f1s","g1","g1s","a1","a1s","b1","c2"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        decibelsLabel.transform =  CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        volumeSlider.value = 0.5
        
        // Do any additional setup after loading the view.
    }

    @IBAction func playSound(_ sender: UIButton) {
    
        let idKey = sender.tag
        let fileName = self.soundsArray[idKey - 1]
        
        if let soundURL : URL = Bundle.main.url(forResource: fileName, withExtension: "mp3"){
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
        }
    }
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        
        self.audioPlayer1?.volume = Float(sender.value)
        //self.decibelsLabel.text = ("\(audioPlayer1.averagePower(forChannel: 0))Db")
//        print(audioPlayer1.volume)
        
    }
    
}

