//
//  WhatHappendViewController.swift
//  BBallStatsFromScratch
//
//  Created by Fred Erik on 03.09.17.
//  Copyright © 2017 Fred Erik. All rights reserved.
//

import UIKit
var collectStatsForBothTeams = false




class WhatHappendViewController: UIViewController {
var collectStatsForBothTeams = false
var homeTeamColor = UIColor.white
var guestTeamColor = UIColor.black
    var currentScoreTeamTwo = 0
    var tappedAction = "2pointer"
    var pointsOfAction = 0
    var segueToWhoMade = "whatHappendToWhoMadeItSegue"
    var Period = 1
    var currentMinute = 1
    var currentMinuteMinusTwo = -1
    var currentMinuteMinusOne = 0
    var currentMinutePlusOne = 2
    var currentMinutePlusTwo = 3
    var GameTime = 10
    var currentScoreTeamOne = 0

var settings : [Settings] = []
var stats : [Stat] = []
    
    @IBOutlet weak var lastStatMinuteLabel: UILabel!
    
    @IBOutlet weak var lastStatActionLabel: UILabel!
    
    @IBOutlet weak var lastStatPlayerLabel: UILabel!
    
    @IBOutlet weak var twoMinutesBackLabel: UILabel!
    
    @IBOutlet weak var lastMinuteLabel: UILabel!
    
    @IBOutlet weak var CurrentMinuteLabel: UILabel!
    
    @IBOutlet weak var nextMinuteLabel: UILabel!
    
    @IBOutlet weak var plusTwoMinutesLabel: UILabel!
    
    @IBOutlet weak var currentScoreTeamOneLabel: UILabel!
    
    @IBOutlet weak var currentScoreTeamTwoLabel: UILabel!
    
    @IBOutlet weak var periodLabel: UILabel!
    
    @IBAction func twoMinutesBackPressed(_ sender: UIButton) {
        if currentMinute > 2 {
            currentMinute = currentMinute - 2
            currentMinuteMinusTwo = currentMinuteMinusTwo - 2
            currentMinuteMinusOne = currentMinuteMinusOne - 2
            currentMinutePlusOne = currentMinutePlusOne - 2
            currentMinutePlusTwo = currentMinutePlusTwo - 2
        }
        updateLabels()
        
    }
    
    
    @IBAction func oneMinuteBackPressed(_ sender: UIButton) {
        if currentMinute > 1 {
            currentMinute = currentMinute - 1
            currentMinuteMinusTwo = currentMinuteMinusTwo - 1
            currentMinuteMinusOne = currentMinuteMinusOne - 1
            currentMinutePlusOne = currentMinutePlusOne - 1
            currentMinutePlusTwo = currentMinutePlusTwo - 1
        }
        updateLabels()
    }
    
    
    @IBAction func nextMinutePressed(_ sender: UIButton) {
        if currentMinute <= GameTime - 1 {
            currentMinute = currentMinute + 1
            currentMinuteMinusTwo = currentMinuteMinusTwo + 1
            currentMinuteMinusOne = currentMinuteMinusOne + 1
            currentMinutePlusOne = currentMinutePlusOne + 1
            currentMinutePlusTwo = currentMinutePlusTwo + 1
        }
        updateLabels()
    }
    
    @IBAction func skipTwoMinutesPressed(_ sender: UIButton) {
        if currentMinute <= GameTime - 2 {
            currentMinute = currentMinute + 2
            currentMinuteMinusTwo = currentMinuteMinusTwo + 2
            currentMinuteMinusOne = currentMinuteMinusOne + 2
            currentMinutePlusOne = currentMinutePlusOne + 2
            currentMinutePlusTwo = currentMinutePlusTwo + 2
        } else if currentMinute == GameTime - 1 {
            self.performSegue(withIdentifier: "breakSegue", sender: self)
        } else if currentMinute == GameTime {
            self.performSegue(withIdentifier: "breakSegue", sender: self)
        }
        updateLabels()
    }
    func updateLabels(){
        let helpVar = GameTime - 1
        self.CurrentMinuteLabel.text = "\(currentMinute)"
        if currentMinuteMinusTwo >= (GameTime-helpVar) {
            self.twoMinutesBackLabel.text = "\(currentMinuteMinusTwo)"
        } else {
            self.twoMinutesBackLabel.text = "" }
        if currentMinuteMinusOne >= (GameTime-helpVar) {
            self.lastMinuteLabel.text = "\(currentMinuteMinusOne)"
        } else {
            self.lastMinuteLabel.text = "" }
        
        if currentMinutePlusOne < GameTime + 1 {
            self.nextMinuteLabel.text = "\(currentMinutePlusOne)"
        } else {
            self.nextMinuteLabel.text = "" }
        
        if currentMinutePlusTwo < GameTime + 1 {
            self.plusTwoMinutesLabel.text = "\(currentMinutePlusTwo)"
        } else {
            if Period >= 4 && currentScoreTeamOne == currentScoreTeamTwo {
                self.plusTwoMinutesLabel.text = "OT"
            } else {
                self.plusTwoMinutesLabel.text = "Break"            }
        }
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let stat = Stat(context: context)
        stat.minute = Int16(currentMinute)
        print("current Minute \(stat.minute)")
     //   currentMinute = Int(stat.minute)
       // Period = Int(stat.quarter)
        
        lastStatActionLabel.text = stat.action
 
 }
    override func viewDidLoad() {
        super.viewDidLoad()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let settings = Settings(context: context)
        print(settings)
        if settings.collectBothTeams == true {
        segueToWhoMade = "whatHappendToWhoMadeBothTeamsSegue"
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func backToSettingsButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "toInGameSettingsSegue", sender: nil)
    }

    @IBAction func twoPointerPressed(_ sender: UIButton) {
        tappedAction = "2pointer"
        pointsOfAction = 2
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: nil)
    }
    @IBAction func threePointsPressed(_ sender: UIButton) {
        tappedAction = "3pointer"
        pointsOfAction = 3
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: nil)
    }
    
    @IBAction func FTmadePressed(_ sender: UIButton) {
        tappedAction = "madeFreeThrow"
        pointsOfAction = 1
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: nil)
        
    }
    
    @IBAction func FTmissedPressed(_ sender: UIButton) {
        tappedAction = "missedFreeThrow"
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: nil)
        
    }
    
    @IBAction func FoulPressed(_ sender: UIButton) {
        tappedAction = "Foul"
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: nil)
    }
    
    @IBAction func TOPressed(_ sender: UIButton) {
        tappedAction = "Turnover"
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: nil)
    }
    
    @IBAction func StealPressed(_ sender: UIButton) {
        tappedAction = "Steal"
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: nil)
        
    }
    @IBAction func TimeOutPressed(_ sender: UIButton) {
        tappedAction = "TimeOut"
        self.performSegue(withIdentifier: "\(segueToWhoMade)", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    //    let game = Game(context: context)
    
        let stat = Stat(context: context)
        lastStatActionLabel.text = stat.action
        Period = Int(stat.quarter)
        
        print("***** \(stat)")
  //      getSettings()
        updateLabels()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whatHappendToWhoMadeItSegue" {
        let whoVC = segue.destination as! WhoMadeItViewController
        whoVC.action = tappedAction
        whoVC.pointsOfAction = pointsOfAction
        whoVC.minute = currentMinute
        } else if segue.identifier == "breakSeue" {
        let breakVC = segue.destination as! BreakViewController
        breakVC.period = Period
        breakVC.homeTeamScore = currentScoreTeamOne
        breakVC.guestTeamScore = currentScoreTeamTwo
            
        }
    }
/*    func fetchLastStat(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            stats = try context.fetch(Stat.fetchRequest()) // as! [Stat]
            } catch {
            print("Error Error Error")
            }
        
        } */
    
   /* func getSettings() {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            do {
                settings = try context.fetch(Settings.fetchRequest()) as! [Settings]
                
            } catch {
                print("Error Error Error")
            }
 
    } */
}
