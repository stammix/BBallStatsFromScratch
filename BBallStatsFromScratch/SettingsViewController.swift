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
    var period = 1
    var minute = 1
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
        period = 1
        minute = 1
        homeTeamScore = 0
        guestTeamScore = 0
    }
    @IBAction func tipOffTapped(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let setting = Settings(context: context)
        setting.collectBothTeams = switchState
        setting.quarterLenght = Int16(periodLength)
        let game = Game(context: context)
        game.homeTeamColor = homeTeamColor
        game.homeTeamPale = homeTeamPale
        game.guestTeamColor = guestTeamColor
        game.guestTeamPale = guestTeamPale
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("*/*/*/* \(setting) ** \(game)")
 
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
    @IBAction func homeTeamWhiteColorTapped(_ sender: UIButton) {
        homeTeamColor = UIColor.white
        homeTeamPale = true
    }
    @IBAction func homeTeamYellowColorTapped(_ sender: AnyObject) {
        homeTeamColor = UIColor.yellow
        homeTeamPale = true
    }
    @IBAction func homeTeamGreenColorTapped(_ sender: AnyObject) {
        homeTeamColor = UIColor.green
        homeTeamPale = true
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
    @IBAction func guestTeamWhiteColorTapped(_ sender: AnyObject) {
        guestTeamColor = UIColor.white
        guestTeamPale = true
    }
    
    @IBAction func guestTeamYellowColorTapped(_ sender: AnyObject) {
        guestTeamColor = UIColor.yellow
        guestTeamPale = true
    }
    @IBAction func guestTeamGreenColorTapped(_ sender: AnyObject) {
        guestTeamColor = UIColor.green
        guestTeamPale = true
    }
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
