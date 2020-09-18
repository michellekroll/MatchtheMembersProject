//
//  StartViewController.swift
//  Meet the Members
//
//  Created by Michelle Kroll on 9/16/20.
//  Copyright © 2020 Michelle Kroll. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.startButton.layer.cornerRadius = 5
    }

    @IBAction func tapStart(_ sender: UIButton) {
        performSegue(withIdentifier: "segueMain", sender: self)
    }
    
}

