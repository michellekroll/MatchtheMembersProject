//
//  StartScreenViewController.swift
//  Match the Members
//
//  Created by Michelle Kroll on 9/17/20.
//  Copyright © 2020 Michelle Kroll. All rights reserved.
//

import Foundation
import UIKit

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var membersLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.startButton.layer.cornerRadius = 10
        view.setGradientBackground(colorOne: UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 228.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
    }
    
    @IBAction func tapStartButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segueMain", sender: self)
    }
}
