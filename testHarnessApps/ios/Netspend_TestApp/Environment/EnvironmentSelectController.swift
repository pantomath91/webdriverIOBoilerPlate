import Foundation

import UIKit


class EnvironmentSelectController: UIViewController{
    
    var envChoices:String = ""
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SelectEnvTableViewController{
            let vc = segue.destination as! SelectEnvTableViewController
            vc.envChoices = self.envChoices
        }
    }
    
    @IBAction func goBack(_ sender: Any) {
        if let navController = self.navigationController {
                navController.popViewController(animated: true)
              }
    }
}
