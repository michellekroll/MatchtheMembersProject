//
//  MainGameViewController.swift
//  Match the Members
//
//  Created by Michelle Kroll on 9/17/20.
//  Copyright © 2020 Michelle Kroll. All rights reserved.
//

import Foundation
import UIKit

class MainGameViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var memberPicture: UIImageView!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var name1: UIButton!
    @IBOutlet weak var name2: UIButton!
    @IBOutlet weak var name3: UIButton!
    @IBOutlet weak var name4: UIButton!
    
    let names = Constants.names
    var gameList: [String] = []
    var score = 0
    var time = 5
    var timer: Timer!
    var pause = false
    var streak = 0
    var longestStreak = 0
    var member = 0
    var currentName: String!
    var playing = false
    var previousResults: [String] = ["null", "null" , "null"]
   
   
    func shuffler() -> [String] {
    return names.shuffled()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
    if time < 0 {
        pressButton(choice: "Timed Out")
        member += 1
        question(questionNumber: member)
        }
        else {
        timerLabel.text = String(time)
        time -= 1
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if playing == false {
            startGame()
        }
        
        if pause == true {
            pauseGame()
        }
    }
    
    func pauseGame() {
        
        if pause == false {
            pause = true
            timer.invalidate()
            pauseButton.setTitle("Play", for: .normal)
        }
            
        else {
            
            pause = false
            startTimer()
            pauseButton.setTitle("Pause", for: .normal)
        }
        
    }
    
    
    func startGame() {
        
        gameList = shuffler()
        playing = true
        score = 0
        member = 0
        question(questionNumber: member)
        previousResults = ["null", "null" , "null"]
        longestStreak = 0
        
    }
    
    func updateScore(_score: Int) {
        
        scoreLabel.text = ("Score: " + String(score))
        
    }
    
    func nameOptions(_correctName: String) {
        let answer = _correctName
        var shuffledGameList = shuffler()
        shuffledGameList.removeAll(where: { $0 == answer })
        var answerOptions: [String] = [answer, shuffledGameList[0], shuffledGameList[1], shuffledGameList[2]]
        answerOptions.shuffle()
        
        name1.setTitle(answerOptions[0], for: .normal)
        name2.setTitle(answerOptions[1], for: .normal)
        name3.setTitle(answerOptions[2], for: .normal)
        name4.setTitle(answerOptions[3], for: .normal)
        
    }
    
    func updatePreviousResults(chosenName: String) {
        
        previousResults = [chosenName, previousResults[0] , previousResults[1]]
        
    }
    
    func question(questionNumber: Int) {
        time = 5
        if questionNumber >= gameList.count {
            timer.invalidate()
            playing = false
            performSegue(withIdentifier: "segueGameOver", sender: self)
        } else {
            startTimer()
            currentName = gameList[questionNumber]
            memberPicture.image = Constants.getImageFor(name: currentName)
            nameOptions(_correctName: currentName)
            updateScore(_score: score)
        }
        
    }
    
    func pressButton(choice: String) {
        timer.invalidate()
        timerLabel.text = String(5)
        if streak > longestStreak {
            longestStreak = streak
        }
        if choice == currentName {
            score += 1
            streak += 1
            updatePreviousResults(chosenName: choice)
            updateScore(_score: score)
        }
        else {
            streak = 0
            updatePreviousResults(chosenName:choice)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.timerLabel.layer.cornerRadius = 10
        self.scoreLabel.layer.cornerRadius = 10
        self.memberPicture.layer.cornerRadius = 5
        self.name1.layer.cornerRadius = 5
        self.name2.layer.cornerRadius = 5
        self.name3.layer.cornerRadius = 5
        self.name4.layer.cornerRadius = 5
        self.pauseButton.layer.cornerRadius = 5
        self.statsButton.layer.cornerRadius = 5
        startGame()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueStats" {
            let vc = segue.destination as! StatisticsScreenViewController
            vc.previousNames = previousResults
            vc.longStreak = longestStreak
        }
        
        if segue.identifier == "segueGameOver" {
            let vc = segue.destination as! GameDoneViewController
            vc.finalScore = score
        }
    }
    
    
    @IBAction func pressName1(_ sender: UIButton) {
        pressButton(choice: name1.currentTitle ?? "Missing Name")
        member += 1
        question(questionNumber: member)
        
    }
    
    @IBAction func pressName2(_ sender: UIButton) {
        pressButton(choice: name2.currentTitle ?? "Missing Name")
        member += 1
        question(questionNumber: member)
        
    }
    
    @IBAction func pressName3(_ sender: UIButton) {
        pressButton(choice: name3.currentTitle ?? "Missing Name")
        member += 1
        question(questionNumber: member)
        
    }
    
    @IBAction func pressName4(_ sender: UIButton) {
        pressButton(choice: name4.currentTitle ?? "Missing Name")
        member += 1
        question(questionNumber: member)
        
    }
    
    @IBAction func pressStats(_ sender: UIButton) {
        pause = false
        pauseGame()
        performSegue(withIdentifier: "segueStats", sender: self)
    }
        
    @IBAction func pressPause(_ sender: UIButton) {
        timer.invalidate()
        pauseGame()
        
    }
    
}
