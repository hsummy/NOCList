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

   
        self.clearsSelectionOnViewWillAppear = false


        self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "NOCListCell", for: indexPath)

        let anAgent = agents[indexPath.row]
        cell.textLabel?.text = anAgent.realName
        cell.detailTextLabel?.text = anAgent.coverName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert
        {
            
        }    
    }
    


//MARK: - Navigation
    
    
    let detailSegueIdentifier = "ShowAgentDetails"
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let selectedAgent = agents[indexPath.row]
        performSegue(withIdentifier: detailSegueIdentifier, sender: selectedAgent)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
      if segue.identifier == detailSegueIdentifier,
        let destinationVC = segue.destination as? AgentDetailsViewController,
        let selectedAgent = sender as? Agent
      {
        destinationVC.agent = selectedAgent
        
      }
        
    }


}//end class NOCListTableViewController
