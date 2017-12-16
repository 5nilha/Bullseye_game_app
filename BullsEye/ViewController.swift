//
//  ViewController.swift
//  BullsEye
//
//  Created by Fabio Quintanilha on 12/6/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let maxRound = 10
    
    var currentValue = 1
    var targetValue = 0
    var rounds = 0
    var score = 0
    var maxScores = [Int]()
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var roundsLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updatingSliderUI()
        startNewRound()
        
    }
    
    func updatingSliderUI() {
        //Changing the thumbImage
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImagHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImagHighlighted, for: .highlighted)
        
        
        //changing the slider track background
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value) // lroundf rounds the current float number to the near Integer
    }
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        let differenceValue = calculateDifference()
        var points = 100 - differenceValue
        
        let title: String
        if differenceValue == 0 {
            title = "Perfect!"
            points += 100
        }
        else if differenceValue < 5 {
            title = "You almost had it!"
            if differenceValue == 1 {
                 points += 50
            }
        }
        else if differenceValue < 10 {
            title = "pretty good!"
        }
        else {
            title = "Not even close..."
        }
        
        score += points
        
        let message = "You choice was: \(currentValue) \n" +
                      "You scored \(points)"
        
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction (title: "Awesome", style: .default, handler: {
            action in
            
            self.startNewRound()
            
        })
     
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    func updateLabels() {
        targetValueLabel.text =
        "\(targetValue)"
        roundsLabel.text = "Round:  \(rounds)"
        scoreLabel.text = "Score:  \(score)"
    }
    
    
    func startNewRound() {
        targetValue = Int(arc4random_uniform(100)) + 1
        currentValue = 1
        slider.value = Float(currentValue)
        currentValue = lroundf(slider.value)
        rounds += 1
        if self.rounds > maxRound {
            self.endGame()
        }
        else {
            updateLabels()
        }
    }
    
    
    func calculateDifference() -> Int {
        
        var difference: Int
        
        difference = abs(targetValue - currentValue)
        
        return difference
    }
    
    
    func endGame() {

        let title = "GAME OVER!"
        let message = "Your maximum score is \(score)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Start New Game", style: .default, handler: {
            action in
            self.startNewGame()
        })
        
        alert.addAction(action)
        
        maxScores.append(score)
        present(alert, animated: true, completion: nil)
    }
    
    
    func startNewGame(){
        rounds = 0
        score = 0
        startNewRound()
    }
    
    
    @IBAction func startOver(_ sender: UIButton) {
        startNewGame()
    }

    
    @IBAction func infoBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "aboutVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? AboutViewController {
            destinationVC.leaderboardPoints = maxScores
        }
    }

    
}

