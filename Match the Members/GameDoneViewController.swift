//
//  GameDoneViewController.swift
//  Match the Members
//
//  Created by Michelle Kroll on 9/17/20.
//  Copyright © 2020 Michelle Kroll. All rights reserved.
//

import Foundation
import UIKit

class GameDoneViewController: UIViewController {

    
    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    var finalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.setGradientBackground(colorOne: UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 228.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
         self.playAgainButton.layer.cornerRadius = 10
        finalScoreLabel.text = ("Final Score: " + String(finalScore))
    }
    
    @IBAction func goToStart(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
