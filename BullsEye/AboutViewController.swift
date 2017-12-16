//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Fabio Quintanilha on 12/7/17.
//  Copyright © 2017 Fabio Quintanilha. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    var leaderboardPoints = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func leaderboardBtn(_ sender: Any) {
        print(leaderboardPoints)
        performSegue(withIdentifier: "leaderboardVC", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? LeaderboardViewController {
            destinationVC.leaderBoard = leaderboardPoints
        }
    }
    
    
    @IBAction func closeBtn() {
        dismiss(animated: true, completion: nil) // dismiss the View Controller
    }
    

}
