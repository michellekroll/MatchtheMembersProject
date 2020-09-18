//
//  StatisticsViewController.swift
//  
//
//  Created by Michelle Kroll on 9/17/20.
//

import Foundation
import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet weak var statisticsLabel: UILabel!
    @IBOutlet weak var longestStreakLabel: UILabel!
    @IBOutlet weak var previousResultLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var longStreak: Int = 0
    var previousNames: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.statisticsLabel.layer.cornerRadius = 5
        self.longestStreakLabel.layer.cornerRadius = 5
        self.previousResultLabel.layer.cornerRadius = 5
        self.backButton.layer.cornerRadius = 5
        longestStreakLabel.text = String(longStreak)
        previousResultLabel.text = previousNames[0] + ", " + previousNames[1] + ", " + previousNames[2]
    }
    
    @IBAction func tapBacktoGame(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
}
