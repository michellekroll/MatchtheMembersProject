//
//  GameOverViewController.swift
//  
//
//  Created by Michelle Kroll on 9/17/20.
//

import Foundation
import Foundation
import UIKit

class GameOverViewController: UIViewController {

    @IBOutlet weak var gameOverLabel: UILabel!
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var finalScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        finalScoreLabel.text = String(finalScore)
    }
    
    @IBAction func goToStart(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
}
