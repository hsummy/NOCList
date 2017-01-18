//
//  Agent.swift
//  NOCList
//
//  Created by HSummy on 12/6/16.
//  Copyright © 2016 HSummy. All rights reserved.
//

import Foundation
import UIKit

struct Agent

{
    var coverName: String?
    let realName: String!
    var accessLevel: Int?
    
    init(coverName: String, realName: String, accessLevel: Int)
    

    {
        self.coverName = coverName
        self.realName = realName
        self.accessLevel = accessLevel
    
    }
        //David Johnson helped me with the next line of code.
        static func agentNameDictionariesFromArrayJSON(agentsArray: [[String: Any]]) -> [Agent]?
    
        {
            var dictionaryDetailsNOCAgents = [Agent]()
            
            if  agentsArray.count > 0
            {
                for anItem in agentsArray
                {
                   
                    let coverName = anItem["coverName"] as? String
                    let realName = anItem["realName"] as! String
                    let accessLevel = anItem["accessLevel"] as? Int
                    
                    //gave me an error when I put coverName before realName??? Answer was because in the 'init', I had them out of order.
                    //it gives me a Thread1: EXC_BAD_INSTRUCTION error??? Answer is I did not make the let accessLevel as an Int throughout, when I had it as a String in the line above. I set property before it was created?
                  let anAgent = Agent(coverName: coverName!, realName: realName,  accessLevel: accessLevel!)
                    
                    
                   dictionaryDetailsNOCAgents.append(anAgent)
                }
                return dictionaryDetailsNOCAgents
            }
            else
            {
            return nil
            }
    }//end of static
    
}//end of struct Agent
