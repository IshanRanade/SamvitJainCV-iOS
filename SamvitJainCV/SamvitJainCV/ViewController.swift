//
//  ViewController.swift
//  SamvitJainCV
//
//  Created by Samvit Jain on 4/25/15.
//  Copyright (c) 2015 JainDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "Cell"
    let headerIdentifier = "Header"
    
    let cellTitles = [["Princeton University", "Redmond High School", "Independent Coursework"],
        ["Software", "Hardware", "Other"],
        ["LinkMeUp", "Information Security Research", "Game Theory Research", "Microrobotics Internship", "Blackwell Elementary Math Club"],
        ["VEX Robotics World Championship", "American Mathematics Competition", "National History Day Competiton"]]
    
    let cellDetails = [["B.S.E. Computer Science", "Math team president; National AP Scholar", "Stanford CS193P - iPhone App. Development"],
        ["Objective-C, Java, C", "Programmable logic, microcontrollers, Verilog", "Documentary filmmaking in Adobe Premiere Pro"],
        ["Music and video messaging iPhone application", "Storage scheme for mitigating Bitcoin theft", "Conway's theory of surreal numbers", "Autonomous control system for microrobot", "Founder and lead instructor"],
        ["2nd place team internationally (17 countries)", "Ranked in top 200 of 60,000 national participants", "1st place history paper in the U.S."]]
    
    let cellImages = [[UIImage(named: "Princeton-Logo"), UIImage(named: "RHS"), UIImage(named: "Stanford")],
        [UIImage(named: "XCode"), UIImage(named: "Microcontroller"), UIImage(named: "PremierePro")],
        [UIImage(named: "LMUIcon"), UIImage(named: "Bitcoin-Logo"), UIImage(named: "GameOfLife"), UIImage(named: "Microrobot"), UIImage(named: "MathContest")],
        [UIImage(named: "VEX"), UIImage(named: "AMC"), UIImage(named: "NHD")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.headerIdentifier)
        
        tableView.delegate = self;
        tableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

// MARK: Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return cellTitles.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cellTitles[section].count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        /*var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath:indexPath) as? UITableViewCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)
        }*/
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: cellIdentifier)

        let row = indexPath.row
        let section = indexPath.section
        
        cell.textLabel?.text = cellTitles[section][row]
        cell.detailTextLabel?.text = cellDetails[section][row]
        cell.selectionStyle = .None

        var image:UIImage = cellImages[section][row]!
        cell.imageView?.image = image
        
        return cell
    }
    
// MARK: Table view delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55.0
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        var headerCell = tableView.dequeueReusableCellWithIdentifier(headerIdentifier) as! UITableViewCell
        headerCell.backgroundColor = UIColor.cyanColor()
        
        switch (section) {
            case 0:
                headerCell.textLabel?.text = "Education"

            case 1:
                headerCell.textLabel?.text = "Skills"

            case 2:
                headerCell.textLabel?.text = "Experience"

            default:
                headerCell.textLabel?.text = "Honors and Awards"
        }
        
        return headerCell
    }
}

