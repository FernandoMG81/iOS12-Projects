//
//  ThirdViewController.swift
//  Piano
//
//  Created by Fernando Martin Gordillo on 02/02/2021.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var decibelsLabel: UILabel!
    @IBOutlet weak var volumeSlider: UISlider!
    
    var audioPlayer : AVAudioPlayer!
    let soundsArray = ["g-e","g-b","g-g","g-d","g-a","g-e2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        volumeSlider.transform = CGAffineTransform(rotationAngle: CGFloat.pi / -2)
        volumeSlider.value = 0.5
        // Do any additional setup after loading the view.
    }
    

    @IBAction func playSound(_ sender: UIButton) {
        
        let idKey = sender.tag
        let fileName = soundsArray[idKey - 1]
        
        if let soundURL : URL = Bundle.main.url(forResource: fileName, withExtension: "mp3"){
        do {
            print("URL: \(soundURL)")
            audioPlayer = try AVAudioPlayer.init(contentsOf: soundURL)
         } catch{
            print(error)
        }
            audioPlayer.play()
            audioPlayer.volume = self.volumeSlider.value
            audioPlayer.isMeteringEnabled = true
            audioPlayer.updateMeters()
            decibelsLabel.text = ("\(audioPlayer.averagePower(forChannel: 0))Db")
            print(audioPlayer.volume)
        }
        
    }
    
    @IBAction func volumeChanged(_ sender: UISlider) {
        
        self.audioPlayer?.volume = Float(sender.value)
        //self.decibelsLabel.text = ("\(audioPlayer1.averagePower(forChannel: 0))Db")
//        print(audioPlayer1.volume)
        
    }

}
