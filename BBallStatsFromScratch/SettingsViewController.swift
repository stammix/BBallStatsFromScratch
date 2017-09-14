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
    var Period = 1
    var Minute = 1
    var homeTeamScore = 0
    var guestTeamScore = 0
    var periodLength = 10
    var switchState = 1
    
    @IBAction func teamSwitch(_ sender: UISwitch) {
        if switchState == 1 {
            switchState = 2
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let setting = Settings(context: context)
            setting.collectBothTeams = true
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        } else if switchState == 2 {
            switchState = 1
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let setting = Settings(context: context)
            setting.collectBothTeams = false
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
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
        setting.quarterLenght = Int16(periodLength)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        self.performSegue(withIdentifier: "SettingsToGameSegue", sender: self)
    }
    @IBAction func homeTeamBlackColorTapped(_ sender: UIButton) {
        homeTeamColor = UIColor.black
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let setting = Game(context: context)
        setting.homeTeamColor = homeTeamColor
        setting.homeTeamPale = false
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    @IBAction func homeTeamBlueColorTapped(_ sender: UIButton) {
        homeTeamColor = UIColor.blue
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let setting = Game(context: context)
        setting.homeTeamColor = homeTeamColor
        setting.homeTeamPale = false
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    @IBAction func homeTeamRedColorTapped(_ sender: UIButton) {
        homeTeamColor = UIColor.red
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let setting = Game(context: context)
        setting.homeTeamColor = homeTeamColor
        setting.homeTeamPale = false
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    @IBAction func guestTeamBlackColorTapped(_ sender: UIButton) {
        guestTeamColor = UIColor.black
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let setting = Game(context: context)
        setting.guestTeamColor = guestTeamColor
        setting.guestTeamPale = false
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    @IBAction func guestTeamBlueColorTapped(_ sender: UIButton) {
        guestTeamColor = UIColor.blue
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let setting = Game(context: context)
        setting.guestTeamColor = guestTeamColor
        setting.guestTeamPale = false
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    @IBAction func guestTeamRedColorTapped(_ sender: UIButton) {
        guestTeamColor = UIColor.red
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let setting = Game(context: context)
        setting.guestTeamColor = guestTeamColor
        setting.guestTeamPale = false
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
