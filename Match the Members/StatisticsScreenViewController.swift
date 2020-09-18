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
        
        view.setGradientBackground(colorOne: UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 228.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
        self.backButton.layer.cornerRadius = 10
        longestStreakLabel.text = ("Longest streak: " + String(longStreak))
        previousResultLabel.numberOfLines = 5
        previousResultLabel.text = ("Previous Names: " + "\n" + "\n" + previousNames[0] + "\n" + previousNames[1] + "\n" + previousNames[2])
    }
    
    @IBAction func tapBacktoGame(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    
}
