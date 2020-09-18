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
    var correctButton: UIButton!
   
   
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
        name1.backgroundColor = .white
        name2.backgroundColor = .white
        name3.backgroundColor = .white
        name4.backgroundColor = .white
        member = questionNumber + 1
        if questionNumber >= gameList.count {
            playing = false
            //timer.invalidate()
            performSegue(withIdentifier: "segueGameOver", sender: self)
        } else {
            startTimer()
            currentName = gameList[questionNumber]
            memberPicture.image = Constants.getImageFor(name: currentName)
            nameOptions(_correctName: currentName)
            updateScore(_score: score)
        }
        
    }
    
    func pressButton(choice: String) -> Bool{
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
            return true
        }
        else {
            streak = 0
            updatePreviousResults(chosenName:choice)
            return false
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.timerLabel.layer.cornerRadius = 10
        self.scoreLabel.layer.cornerRadius = 10
        self.memberPicture.layer.cornerRadius = 10
        self.name1.layer.cornerRadius = 10
        self.name2.layer.cornerRadius = 10
        self.name3.layer.cornerRadius = 10
        self.name4.layer.cornerRadius = 10
        self.pauseButton.layer.cornerRadius = 10
        self.statsButton.layer.cornerRadius = 10
        view.setGradientBackground(colorOne: UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 228.0/255.0, alpha: 1.0), colorTwo: UIColor(red: 200.0/255.0, green: 200.0/255.0, blue: 200.0/255.0, alpha: 1.0))
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
    
    func flashGreen(correctButton: UIButton!) {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options : .curveEaseInOut, animations: {correctButton.backgroundColor = UIColor.green}, completion: { _ in self.question(questionNumber: self.member)})
    }
    
    func flashRed(wrongButton: UIButton!) {
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options : .curveEaseInOut, animations: {wrongButton.backgroundColor = UIColor.red}, completion: { _ in self.question(questionNumber: self.member)})
        }
    
    var colorFlashGreen = false
    
    func callColor(button: UIButton) {
        
        colorFlashGreen = pressButton(choice: button.title(for: .normal) ?? "Missing Name")
        timer.invalidate()
        if colorFlashGreen {
            flashGreen(correctButton: button)
        }
        else {
            flashRed(wrongButton: button)
        }
        
        
    }
    @IBAction func pressName1(_ sender: UIButton) {
        
        callColor(button: name1)
        
    }
    
    @IBAction func pressName2(_ sender: UIButton) {
       
        callColor(button: name2)
        
        }
        
    
    @IBAction func pressName3(_ sender: UIButton) {
      
        callColor(button: name3)
        
        }
        
    
    @IBAction func pressName4(_ sender: UIButton) {
    
        callColor(button: name4)
        
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
