//
//  LeaderboardViewController.swift
//  BullsEye
//
//  Created by Fabio Quintanilha on 12/7/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

class LeaderboardViewController: UIViewController {
    
    var leaderBoard = [Int]()
    

    @IBOutlet weak var firstPlace: UILabel!
    @IBOutlet weak var secondPlace: UILabel!
    @IBOutlet weak var thirdPlace: UILabel!
    @IBOutlet weak var fourthPlace: UILabel!
    @IBOutlet weak var fifthPlace: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bestScores()
        print("Developer \(leaderBoard.sorted().reversed())")
    }

    func bestScores(){
        let zeroScore = [000, 000, 000, 000, 000]
        
        leaderBoard.append(contentsOf: zeroScore)
        leaderBoard.sorted().reversed()
        
        firstPlace.text = "1st:   \(leaderBoard[0])"
        secondPlace.text = "2nd:   \(leaderBoard[1])"
        thirdPlace.text = "3rd:   \(leaderBoard[2])"
        fourthPlace.text = "4th:   \(leaderBoard[3])"
        fifthPlace.text = "5th:   \(leaderBoard[4])"
    }
    
    @IBAction func closeBtn() {
            dismiss(animated: true, completion: nil)
    }
    
    
}
