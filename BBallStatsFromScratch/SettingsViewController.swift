//
//  SettingsViewController.swift
//  BBallStatsFromScratch
//
//  Created by Fred Erik on 03.09.17.
//  Copyright © 2017 Fred Erik. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var homeTeamColor = UIColor.white
    var guestTeamColor = UIColor.black
    var homeTeamPale = true
    var guestTeamPale = false
    var Period = 1
    var Minute = 1
    var homeTeamScore = 0
    var guestTeamScore = 0
    var periodLength = 10
    var switchState = false
    
    @IBAction func teamSwitch(_ sender: UISwitch) {
        if switchState == false {
            switchState = true
            
        } else if switchState == true {
            switchState = false
        }
    }
    
    @IBAction func resetGameTapped(_ sender: UIButton) {
        Period = 1
        Minute = 1
        homeTeamScore = 0
        guestTeamScore = 0
    }
    @IBAction func tipOffTapped(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let setting = Settings(context: context)
        setting.collectBothTeams = switchState
        setting.quarterLenght = Int16(periodLength)
        let game = Game(context: context)
        game.homeTeamColor = false
        game.homeTeamPale = true
        game.guestTeamColor = true
        game.guestTeamPale = false
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.performSegue(withIdentifier: "SettingsToGameSegue", sender: self)
    }
    @IBAction func homeTeamBlackColorTapped(_ sender: UIButton) {
        homeTeamColor = UIColor.black
        homeTeamPale = false
    }
    @IBAction func homeTeamBlueColorTapped(_ sender: UIButton) {
        homeTeamColor = UIColor.blue
        homeTeamPale = false
    }
    @IBAction func homeTeamRedColorTapped(_ sender: UIButton) {
        homeTeamColor = UIColor.red
        homeTeamPale = false
    }
    @IBAction func guestTeamBlackColorTapped(_ sender: UIButton) {
        guestTeamColor = UIColor.black
        guestTeamPale = false
    }
    @IBAction func guestTeamBlueColorTapped(_ sender: UIButton) {
        guestTeamColor = UIColor.blue
        guestTeamPale = false
    }
    @IBAction func guestTeamRedColorTapped(_ sender: UIButton) {
        guestTeamColor = UIColor.red
        guestTeamPale = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
