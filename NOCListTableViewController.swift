//
//  NOCListTableViewController.swift
//  NOCList
//
//  Created by HSummy on 12/6/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

import UIKit



class NOCListTableViewController: UITableViewController
{
    var agents = [Agent]()
    var textLabel: UILabel!
    var detailTextLabel: UILabel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "NOC List"
        loadAgents()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadAgents()
    {
        do
        {
            let filePath = Bundle.main.path(forResource: "NOC", ofType: "json")
            let dataFromFile = try? Data(contentsOf: URL(fileURLWithPath: filePath!))
            if let agentData = try JSONSerialization.jsonObject(with: dataFromFile!, options: []) as? [[String: Any]]
            {
                if let possibleAgents = Agent.agentNameDictionariesFromArrayJSON(agentsArray: agentData)
                {
                    agents = possibleAgents
                }
            }
        }
        catch
        {
            print(error.localizedDescription)
        }
    }


    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }

// MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
     
        return agents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nocListCell", for: indexPath)

        let anAgent = agents[indexPath.row]
        cell.textLabel?.text = anAgent.realName
        cell.detailTextLabel?.text = anAgent.coverName

        return cell
    }
    

    /*
     Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

   //MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
