//
//  ViewController.swift
//  GuessEye
//
//  Created by Majid Iqbal on 02/10/2016.
//  Copyright © 2016 CodeMania. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet var slider : UISlider!
    @IBOutlet var targetLabel :UILabel!
    @IBOutlet var scoreLabel : UILabel!
    @IBOutlet var roundLabel : UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       startNewGame()   
        updateLabels()
        
        //Setting for slider
        
        //Thumb normal image
        let thumbNormalImage = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbNormalImage, for:.normal)
        
        //Thumb highlighted image
         let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for:.highlighted)
        
        let inset = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        //Setting for left Track of slider
        if let trackLeftImage = UIImage(named:"SliderTrackLeft"){
            
            let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: inset)
            slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
            
        }
        //Setting for right Track of slider
        if let trackRightImage = UIImage(named: "SliderTrackRight"){
            
            let trackRightResizable = trackRightImage.resizableImage(withCapInsets: inset)
            slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        }
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(){
        
     
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
       
        
        var title :String
        if difference == 0 {
            title = "Perfect"
            points += 100
        }else if difference < 5 {
            title = "You almost had it"
            if difference == 1{
                points += 50
            }
        }else if difference < 10 {
            title = "Pretty Good"
        } else {
            title = "Not even close..."
        }
         score += points
        
        let message = "You scored \(points) points "
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Thanks", style:.default, handler:{ action in
            
          self.startNewRound()
          self.updateLabels()
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        
       currentValue = lroundf(slider.value)
        
    }
    
    @IBAction func startOver(){
    
      startNewGame()
      updateLabels()
        
        let transition = CATransition()
        transition.type  = kCATransitionFade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        view.layer.add(transition, forKey: nil)
    
    }
    
    func startNewRound(){
        
       
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
//      currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels(){
        targetLabel.text = "\(targetValue)"
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewGame(){
        
        score = 0
        round = 0
        startNewRound()
    }
}

