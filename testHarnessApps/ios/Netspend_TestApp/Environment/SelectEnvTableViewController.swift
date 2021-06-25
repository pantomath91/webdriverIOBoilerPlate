//
//  SelectEnvironmentController.swift
//  Netspend
//
//  Created by Hitesh Batra on 16/07/20.
//  Copyright © 2020 Hitesh Batra. All rights reserved.
//

import UIKit

class SelectEnvTableViewController: UITableViewController {
       
    //MARK: Properties
    var selectEnvs = [SelectEnvironment]()
    var envChoices:String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadEnvironment()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        tableView.tableFooterView = UIView()
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectEnvs.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cellIdentifier = "SelectEnvTableViewCell"
           guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SelectEnvTableViewCell  else {
               fatalError("The dequeued cell is not an instance of SelectEnvTableViewCell.")
           }
           // Configure the cell...
           let selectEnv = selectEnvs[indexPath.row]
           cell.envName.text = selectEnv.env
        
            if (envChoices ==  selectEnv.env) {
              tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
              cell.accessoryType =  .checkmark;
            }
           return cell
    }
    //For single choice selection
     override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .checkmark
         let selectEnv = selectEnvs[indexPath.row]
         NotificationCenter.default.post(name: Notification.Name("text"), object: selectEnv.env)
     }
     
     override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         tableView.cellForRow(at: indexPath as IndexPath)?.accessoryType = .none
     }
    
    
     
    private func loadEnvironment() {
              
        guard let env1 = SelectEnvironment(env: "TEST:C") else {
          fatalError("Unable to instantiate TEST:C environment")
        }
        guard let env2 = SelectEnvironment(env: "PIT:C") else {
          fatalError("Unable to instantiate PIT:C environment")
        }
        guard let env3 = SelectEnvironment(env: "LOCAL:8081") else {
           fatalError("Unable to instantiate Local Environment")
        }
        guard let env4 = SelectEnvironment(env: "CERT (For Partners)") else {
           fatalError("Unable to instantiate CERT Environment")
        }
        guard let env5 = SelectEnvironment(env: "CLOUDTEST:A") else {
            fatalError("Unable to instantiate CLOUD:A Environment")
        }

        selectEnvs += [env1, env2, env3, env4, env5]
    }

}
