//
//  ViewController.swift
//  Netspend_TestApp
//
//  Created by Nithya Venkatraman on 20/05/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onContinue(_ sender: Any) {
        self.performSegue(withIdentifier: "envSwitchSegue", sender: self)
    }


}

