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
        
        //self.startButton.layer.cornerRadius = 5
    }
    
    @IBAction func tapStartButton(_ sender: UIButton) {
        performSegue(withIdentifier: "segueMain", sender: self)
    }
}
