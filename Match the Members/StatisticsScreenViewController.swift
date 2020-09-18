//
//  StatisticsScreenViewController.swift
//  Match the Members
//
//  Created by Michelle Kroll on 9/17/20.
//  Copyright © 2020 Michelle Kroll. All rights reserved.
//

import Foundation
import UIKit

class StatisticsScreenViewController: UIViewController {
    
    @IBOutlet weak var statisticsLabel: UILabel!
    @IBOutlet weak var longestStreakLabel: UILabel!
    @IBOutlet weak var previousResultLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    var longStreak: Int = 0
    var previousNames: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.statisticsLabel.layer.cornerRadius = 5
        //self.longestStreakLabel.layer.cornerRadius = 5
        //self.previousResultLabel.layer.cornerRadius = 5
        //self.backButton.layer.cornerRadius = 5
        longestStreakLabel.text = ("Longest streak: " + String(longStreak))
        previousResultLabel.numberOfLines = 5
        previousResultLabel.text = ("Previous Names: " + "\n" + "\n" + previousNames[0] + "\n" + previousNames[1] + "\n" + previousNames[2])
    }
    
    @IBAction func tapBacktoGame(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
