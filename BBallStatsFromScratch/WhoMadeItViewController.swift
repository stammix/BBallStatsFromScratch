//
//  WhoMadeItViewController.swift
//  BBallStatsFromScratch
//
//  Created by Fred Erik on 03.09.17.
//  Copyright © 2017 Fred Erik. All rights reserved.
//

import UIKit

class WhoMadeItViewController: UIViewController {
    
    var chosenTeam = 1
    var action = "jöafdj"
    var pointsOfAction = 0
    var player = 1
    var stats : [Stat] = []
    var minute = 1
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    

    @IBOutlet weak var jersey1Button: UIButton!
    @IBOutlet weak var jersey2Button: UIButton!
    @IBOutlet weak var jersey3Button: UIButton!
    @IBOutlet weak var jersey4Button: UIButton!
    @IBOutlet weak var jersey5Button: UIButton!
    @IBOutlet weak var jersey6Button: UIButton!
    @IBOutlet weak var jersey7Button: UIButton!
    @IBOutlet weak var jersey8Button: UIButton!
    @IBOutlet weak var jersey9Button: UIButton!
    @IBOutlet weak var jersey10Button: UIButton!
    @IBOutlet weak var jersey11Button: UIButton!
    @IBOutlet weak var jersey12Button: UIButton!
    
    @IBAction func T1P1Pressed(_ sender: UIButton) {
        let newStat = Stat(context: context)
        newStat.player = 1
        newStat.action = action
        newStat.minute = Int16(minute)
        newStat.pointsOfAction = Int16(pointsOfAction)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("whoMadeVC \(newStat)")
        let _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func T1P2Pressed(_ sender: UIButton) {
        let newStat = Stat(context: context)
        newStat.player = 2
        newStat.action = action
        newStat.minute = Int16(minute)
        newStat.pointsOfAction = Int16(pointsOfAction)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("whoMadeVC \(newStat)")
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T1P3Pressed(_ sender: UIButton) {
        let newStat = Stat(context: context)
        newStat.player = 3
        newStat.action = action
        newStat.minute = Int16(minute)
        newStat.pointsOfAction = Int16(pointsOfAction)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("whoMadeVC \(newStat)")
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T1P4Pressed(_ sender: UIButton) {
        let newStat = Stat(context: context)
        newStat.player = 4
        newStat.action = action
        newStat.minute = Int16(minute)
        newStat.pointsOfAction = Int16(pointsOfAction)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("whoMadeVC \(newStat)")
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T1P5Pressed(_ sender: UIButton) {
        let newStat = Stat(context: context)
        newStat.player = 5
        newStat.action = action
        newStat.minute = Int16(minute)
        newStat.pointsOfAction = Int16(pointsOfAction)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        print("whoMadeVC \(newStat)")
        let _ = navigationController?.popViewController(animated: true)
        //navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func T1P6Pressed(_ sender: UIButton) {
        player = 6
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: nil)
        
    }
    @IBAction func T1P7Pressed(_ sender: UIButton) {
        player = 7
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: nil)
    }
    
    @IBAction func T1P8Pressed(_ sender: UIButton) {
        player = 8
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: nil)
    }
    @IBAction func T1P9Pressed(_ sender: UIButton) {
        player = 9
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: nil)
    }
    @IBAction func T1P10Pressed(_ sender: UIButton) {
        player = 10
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: nil)
    }
    @IBAction func T1P11Pressed(_ sender: UIButton) {
        player = 11
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: nil)
    }
    @IBAction func T1P12Pressed(_ sender: UIButton) {
        player = 12
        self.performSegue(withIdentifier: "WhoMadeItToSubstituionT1Segue", sender: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let game = Game(context: context)
        print(")*( \(game.homeTeamColor)")
        jersey1Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey2Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey3Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey4Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey5Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey6Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey7Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey8Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey9Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey10Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey11Button.backgroundColor = game.homeTeamColor as! UIColor?
        jersey12Button.backgroundColor = game.homeTeamColor as! UIColor?
        
        if game.homeTeamPale == true {
            jersey1Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey1Button.setTitleColor(UIColor.black, for: .normal)
            jersey2Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey2Button.setTitleColor(UIColor.black, for: .normal)
            jersey3Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey3Button.setTitleColor(UIColor.black, for: .normal)
            jersey4Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey4Button.setTitleColor(UIColor.black, for: .normal)
            jersey5Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey5Button.setTitleColor(UIColor.black, for: .normal)
            jersey6Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey6Button.setTitleColor(UIColor.black, for: .normal)
            jersey7Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey7Button.setTitleColor(UIColor.black, for: .normal)
            jersey8Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey8Button.setTitleColor(UIColor.black, for: .normal)
            jersey9Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey9Button.setTitleColor(UIColor.black, for: .normal)
            jersey10Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey10Button.setTitleColor(UIColor.black, for: .normal)
            jersey11Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey11Button.setTitleColor(UIColor.black, for: .normal)
            jersey12Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyBlack.png"), for: .normal)
            jersey12Button.setTitleColor(UIColor.black, for: .normal)
        } else if game.homeTeamPale == false {
            jersey1Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey2Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey3Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey4Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey5Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey6Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey7Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey8Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey9Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey10Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey11Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
            jersey12Button.setBackgroundImage(#imageLiteral(resourceName: "BballStatsJerseyWhite.png"), for: .normal)
        }
//
//        jersey1Button.backgroundColor = JerseyColor
//        jersey2Button.backgroundColor = JerseyColor
//        jersey3Button.backgroundColor = JerseyColor
//        jersey4Button.backgroundColor = JerseyColor
//        jersey5Button.backgroundColor = JerseyColor
//        jersey6Button.backgroundColor = JerseyColor
//        jersey7Button.backgroundColor = JerseyColor
//        jersey8Button.backgroundColor = JerseyColor
//        jersey9Button.backgroundColor = JerseyColor
//        jersey10Button.backgroundColor = JerseyColor
//        jersey11Button.backgroundColor = JerseyColor
//        jersey12Button.backgroundColor = JerseyColor
//        
//        print ("HomeTeamColor is \(homeTeamColor)")
//        print ("TappedAction is \(tappedAction)")
//        print("There was a \(tappedAction) in the \(actualMinute). Minute")
//    }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WhoMadeItToSubstituionT1Segue" {
            let whoVC = segue.destination as! SubstitutionViewController
            whoVC.subPlayer = player
            whoVC.chosenTeam = chosenTeam
        }
    }
}
