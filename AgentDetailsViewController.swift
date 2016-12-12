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
    
    @IBOutlet weak var coverNameLabel: UILabel!
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var accessLevelLabel: UILabel!
    
    var coverName = String()
    var realName = String()
    var accessLevel = String()
    

    
    
    override func viewDidLoad()
        
        
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
}
//end of class
