import Foundation

import UIKit
import NetspendSdk

class DashboardViewController: UIViewController {

    @IBOutlet weak var loadTestAppBtn: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    var env: String! = ""
    var netspendViewController:  NetspendSdkViewController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("progress"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didCompleteNotification(_:)), name: Notification.Name("progressComplete"), object: nil)
    }
    
    @IBAction func loadTestAppSelected(_ sender: Any) {
        
        self.connectToNS( account_id:"", card_id:"", env: self.env, purpose: "testHarness", cardIdRequired: false, bankLinkIdRequired: false)
    }
   
    
       
    @IBAction func goBack(_ sender: Any) {
       if let navController = self.navigationController {
                navController.popViewController(animated: true)
              }
    }
    @objc func didGetNotification(_ notification: Notification){
       activityIndicator.startAnimating()
    }
    @objc func didCompleteNotification(_ notification: Notification){
       activityIndicator.stopAnimating()
    }
    
    func connectToNS(account_id:String, card_id:String, env: String, purpose: String, cardIdRequired: Bool, bankLinkIdRequired: Bool) {

        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: "progress")))

                        self.openNewPurpose(purpose: "testHarness", passcode: "", params:  ["abc":222]) { (netspendViewController) in
                            self.netspendViewController = netspendViewController
                            self.netspendViewController.delegate = self;
                            self.navigationController!.pushViewController(self.netspendViewController, animated: true)
                        }
}
    
    func openNewPurpose(purpose: String, passcode: String, params: Dictionary<String, Any>, completionHandler: @escaping (NetspendSdkViewController) -> Void ) {
       DispatchQueue.main.async {
                let netspendViewController = try! NetspendSdk.shared.openWithPurpose(purpose: purpose, withPasscode: passcode, usingParams: params)

                netspendViewController.delegate = self
        
        completionHandler(netspendViewController)
        }
    }
}

// MARK: NetspendSdkViewControllerDelegate
extension DashboardViewController: NetspendSdkViewControllerDelegate {
    func netspendSdkViewController(_ viewController: NetspendSdkViewController, didChange state: NetspendSdkPurposeState) {
        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: "progressComplete")))
        print("[NetspendSDK] State change '\(state)' for purpose '\(viewController.purpose!)'")

        switch state {
        case .started:
            self.showAlertMessage(vc: self, titleStr: "Started!", messageStr: "Purpose succesfully started!!")
            break

        case .cancelled:
            navigationController?.popToViewController((self.navigationController?.viewControllers[2]) as! DashboardViewController, animated: true)
            self.showAlertMessage(vc: self, titleStr: "Cancelled!", messageStr: "Purpose succesfully cancelled")
            break

        case .error(let reason):

            print("[NetspendSDK] Error encountered: \(reason)")
            navigationController?.popToViewController((self.navigationController?.viewControllers[2]) as! DashboardViewController,animated: true)
            
            self.showAlertMessage(vc: self, titleStr: "Error!", messageStr: reason.description)
            break

        case .success(let result):
            print("[NetspendSDK] Success result received \(result), purpose: '\(viewController.purpose!)'")
            navigationController?.popToViewController((self.navigationController?.viewControllers[2]) as! DashboardViewController,animated: true)
            self.showAlertMessage(vc: self, titleStr: "Success!", messageStr: "Success result received \(result)")
           
            break
        }
    }

    func netspendSdkViewController(_ viewController: NetspendSdkViewController, didEvent event: NetspendSdkPurposeEvent) {
        print("Event \(event.name) occured for purpose \(viewController.purpose!)")
    }
    
    func netspendSdkViewController(_ viewController: NetspendSdkViewController, didEncounterFatalError errorMessage: String) {
        print("\(errorMessage) while loading \(viewController.purpose!)")
        navigationController?.popToViewController((self.navigationController?.viewControllers[3]) as! DashboardViewController, animated: true)
        self.showAlertMessage(vc: self, titleStr: "fatalerror", messageStr: errorMessage)
    }
    
    func showAlertMessage(vc: UIViewController, titleStr:String, messageStr:String) -> Void {
        let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert);
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        vc.present(alert, animated: true, completion: nil)
    }
}
