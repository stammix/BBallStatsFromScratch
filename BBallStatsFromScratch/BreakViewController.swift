//
//  BreakViewController.swift
//  BBallStatsFromScratch
//
//  Created by Fred Erik on 03.09.17.
//  Copyright © 2017 Fred Erik. All rights reserved.
//

import UIKit

class BreakViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var homeTeamScore = 0
    var guestTeamScore = 0
    var period = 1
    var stats : [Stat] = []
    
    @IBOutlet weak var statSummaryTableView: UITableView!
    
    @IBOutlet weak var QuarterBreakTitleLabel: UILabel!
    
    @IBOutlet weak var nextQuarterButtonLabel: UIButton!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    @IBAction func nextQuarterButton(_ sender: AnyObject) {
     //   period = period + 1
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let stat = Stat(context: context)
        stat.quarter = 2
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        if period < 4 {
            performSegue(withIdentifier: "breakToGameSegue", sender: self)
        } else if period >= 4 && homeTeamScore == guestTeamScore {
            performSegue(withIdentifier: "breakToGameSegue", sender: self)
        } else {
            performSegue(withIdentifier: "breakToGameSegue", sender: self)
        }
        //  UserDefaults.standard.set("break", forKey: "minute")
        //  UserDefaults.standard.set("break", forKey: "selectedTeam")
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        statSummaryTableView.dataSource = self
        statSummaryTableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        if period == 1 {
            print("*** Break after period 1")
            summaryLabel.text = "Summary Quarter 1"
        } else if period == 2 {
            print("*** Break after period 2")
            summaryLabel.text = "Summary Quarter 2"
        } else if period == 3 {
            print("*** Break after period 3")
            summaryLabel.text = "Summary Quarter 3"
        } else if period == 4 && homeTeamScore == guestTeamScore{
            print("*** Break after period 4")
            summaryLabel.text = "Summary Quarter 4"
            QuarterBreakTitleLabel.text = "Game Summary"
            nextQuarterButtonLabel.setTitle("Overtime Baby", for: .normal)
        } else if period > 4 && homeTeamScore == guestTeamScore{
            print("*** Break after OT \(period - 4)")
            summaryLabel.text = "Summary OT \(period - 4)"
            QuarterBreakTitleLabel.text = "OT Summary"
            nextQuarterButtonLabel.setTitle("Overtime Baby", for: .normal)
        } else if period >= 4 {
            print("*** Break after period 4")
            summaryLabel.text = "Summary Quarter 4"
            QuarterBreakTitleLabel.text = "Game Summary"
            nextQuarterButtonLabel.setTitle("Save GameStats and upload", for: .normal)
        }
    }
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stats.count
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let stat = stats[indexPath.row]
        cell.textLabel?.text = "\(stat.player), \(stat.action), \(stat.pointsOfAction)"
        return cell
    }
}
