//
//  AgentDetailsViewController.swift
//  NOCList
//
//  Created by HSummy on 12/6/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

import UIKit



class AgentDetailsViewController: UIViewController
    
{
    var agent: Agent!
    
    @IBOutlet weak var coverNameLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var accessLevelLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Agent Details"
        
        
        self.realNameLabel.text = agent.realName;
        self.coverNameLabel.text = agent.coverName;
        
        if let accessLevel = agent.accessLevel {
            self.accessLevelLabel.text = "Access Level: \(accessLevel)"
        }
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}//end of class
