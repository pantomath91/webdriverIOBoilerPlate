//
//  envSwitchController.swift
//  Netspend
//
import Foundation
import UIKit
import NetspendSdk
import FraudForce

class EnvironmentSwitcherController: UIViewController, UITextFieldDelegate {

   
    @IBOutlet var selectEnv: UITextField!
    @IBOutlet var submit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectEnv.delegate = self
        
        selectEnv.addTarget(self, action: #selector(textFieldTouch), for: .touchDown)

        if selectEnv.text!.isEmpty{
          submit.isUserInteractionEnabled = false
          submit.alpha = 0.5;
       }
        
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("text"), object: nil)
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        if((selectEnv.text?.contains("For Partners")) == true){
                selectEnv.text = "CERT"
            }
        initNetspendSdk(sdkKey: "NS-\(selectEnv.text ?? "TEST:C")-ae0bca62bd0244949a171ebf0ba49818")
    }
    
    @objc func didGetNotification(_ notification: Notification){
           let text = notification.object as! String?
           selectEnv.text = text
            submit.isUserInteractionEnabled = true
            submit.alpha = 1;
       }

    @objc func textFieldTouch(_ textField: UITextField){
        
      textField.resignFirstResponder()

       if textField == selectEnv{
            let controller = storyboard?.instantiateViewController(withIdentifier: "environmentSegue") as! EnvironmentSelectController
            controller.envChoices = selectEnv.text!
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is DashboardViewController{
          let vc = segue.destination as! DashboardViewController
          vc.env = self.selectEnv.text
        }
       }
    
    func initNetspendSdk(sdkKey: String) {
               let logoPath = Bundle.main.path(forResource: "logo", ofType: "svg")!
               let logoData = NSData(contentsOfFile: logoPath)!
               let logoDataUrl = "data:image/svg+xml;base64,\(logoData.base64EncodedString(options: []))"


               try! NetspendSdk.shared.initialize(
                   sdkId: sdkKey,
                   theme: coconutGrovesNetspendThemeColors,
                branding: [
                    "logo": logoDataUrl,
                    "productName": "Porte",
                    "branding":["phoneNumber": "1-800-267-7080"],
                    "mfeLocations": [
                        "currentPosCircleColor": "#ff0000",
                        "currentPosStrokeColor": "#ff0000",
                        "feeFreeAtmPin": "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ2IiB2aWV3Qm94PSIwIDAgMzggNDYiIHdpZHRoPSIzOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPjxwYXRoIGQ9Im0zMi4zNjEzIDUuNTU1Ny4xMDQuMTA0YzcuMzc5IDcuNDA3IDcuMzc5IDE5LjQxNyAwIDI2LjgyNGwtMTMuNDY1IDEzLjUxNi0xMy40NjYtMTMuNTE2Yy03LjM3OS03LjQwNy03LjM3OS0xOS40MTcgMC0yNi44MjRsLjEwNC0uMTA0YzcuMzc5LTcuNDA4IDE5LjM0NC03LjQwOCAyNi43MjMgMCIgZmlsbD0iI2M1YTM4MCIvPjx0ZXh0IGZpbGw9IiNmZmYiIGZvbnQtZmFtaWx5PSJBY3VtaW5Qcm8tQm9sZCwgQWN1bWluIFBybyIgZm9udC1zaXplPSIxMCIgZm9udC13ZWlnaHQ9ImJvbGQiPjx0c3BhbiB4PSI3LjA3IiB5PSIxOSI+RlJFRTwvdHNwYW4+IDx0c3BhbiB4PSI4LjY5IiB5PSIyOSI+QVRNPC90c3Bhbj48L3RleHQ+PC9nPjwvc3ZnPg==",
                        "reloadPin":            "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ2IiB2aWV3Qm94PSIwIDAgMzggNDYiIHdpZHRoPSIzOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPjxwYXRoIGQ9Im0zMi4zNjEzIDUuNTU1Ny4xMDQuMTA0YzcuMzc5IDcuNDA3IDcuMzc5IDE5LjQxNyAwIDI2LjgyNGwtMTMuNDY1IDEzLjUxNi0xMy40NjYtMTMuNTE2Yy03LjM3OS03LjQwNy03LjM3OS0xOS40MTcgMC0yNi44MjRsLjEwNC0uMTA0YzcuMzc5LTcuNDA4IDE5LjM0NC03LjQwOCAyNi43MjMgMCIgZmlsbD0iI2M1YTM4MCIvPjxnIGZpbGw9IiNmZmYiIHRyYW5zZm9ybT0idHJhbnNsYXRlKDcgNykiPjxwYXRoIGQ9Im0xMi4zNzUgMjNjLTUuODU5IDAtMTAuNjI1LTQuNzY2NS0xMC42MjUtMTAuNjI1czQuNzY2LTEwLjYyNSAxMC42MjUtMTAuNjI1IDEwLjYyNSA0Ljc2NjUgMTAuNjI1IDEwLjYyNS00Ljc2NiAxMC42MjUtMTAuNjI1IDEwLjYyNW0wLTIzYy02LjgyMzUgMC0xMi4zNzUgNS41NTE1LTEyLjM3NSAxMi4zNzVzNS41NTE1IDEyLjM3NSAxMi4zNzUgMTIuMzc1IDEyLjM3NS01LjU1MTUgMTIuMzc1LTEyLjM3NS01LjU1MTUtMTIuMzc1LTEyLjM3NS0xMi4zNzUiLz48cGF0aCBkPSJtMTIuNjE2NyAxNy45NjM4NS41MTYtNC41MTM1YzEuNzE4Ljg4MTUgMS44Njc1IDEuNTUyIDEuODY3NSAyLjM2NiAwIDEuMzA4LTEuMjY4IDEuOTkwNS0yLjM4MzUgMi4xNDc1bS0yLjMyODUtOS4yODVjMC0uNzM0NS44MjE1LTEuNjM1NSAxLjg0Mi0xLjg2OWwtLjQ1MDUgMy45NDY1Yy0xLjM4OC0uOTIxNS0xLjM5MTUtMS43Ni0xLjM5MTUtMi4wNzc1bTMuMDU0NSAyLjkzMDUuNTMwNS00LjYzOWMuNDkzLjE2Ni45Mzc1LjM5OTUgMS4zMDk1LjYxN2wuODg0NS0xLjUwOTVjLS41MDYtLjI5Ny0xLjE4OTUtLjY1NDUtMS45OTItLjg3NGwuMTY5LTEuNDc5NS0xLjczODUtLjE5ODUtLjE3IDEuNDg5NWMtMS45OS4xNTQtMy43OTc1IDEuODYtMy43OTc1IDMuNjYzNSAwIDEuNjEwNS45ODM1IDIuOTQ1NSAyLjkyNCAzLjk3ODVsLS41OTIgNS4xODFjLS41NzktLjE2MTUtMS4wMTk1LS40MjItMS40NTEtLjY3N2wtLjA5OTUtLjA1OTUtLjg4OTUgMS41MDcuMDk3LjA1NzVjLjUzMDUuMzE0NSAxLjIwMzUuNzA1IDIuMTQzLjkyMDVsLS4xNjQ1IDEuNDM5IDEuNzM4NS4xOTg1LjE3LTEuNDg2YzIuMTc5LS4xMTg1IDQuMzM2LTEuNTY0IDQuMzM2LTMuOTIyIDAtMi4xNjEtMS4yOTUtMy4yNDYtMy40MDc1LTQuMjA3Ii8+PC9nPjwvZz48L3N2Zz4=",
                        "atmPin":            "data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjQ2IiB2aWV3Qm94PSIwIDAgMzggNDYiIHdpZHRoPSIzOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj48ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPjxwYXRoIGQ9Im0zMi4zNjEzIDUuNTU1Ny4xMDQuMTA0YzcuMzc5IDcuNDA3IDcuMzc5IDE5LjQxNyAwIDI2LjgyNGwtMTMuNDY1IDEzLjUxNi0xMy40NjYtMTMuNTE2Yy03LjM3OS03LjQwNy03LjM3OS0xOS40MTcgMC0yNi44MjRsLjEwNC0uMTA0YzcuMzc5LTcuNDA4IDE5LjM0NC03LjQwOCAyNi43MjMgMCIgZmlsbD0iIzY1NjU2NSIvPjx0ZXh0IGZpbGw9IiNmZmYiIGZvbnQtZmFtaWx5PSJBY3VtaW5Qcm8tQm9sZCwgQWN1bWluIFBybyIgZm9udC1zaXplPSIxMCIgZm9udC13ZWlnaHQ9ImJvbGQiPjx0c3BhbiB4PSI4LjY5IiB5PSIyNCI+QVRNPC90c3Bhbj48L3RleHQ+PC9nPjwvc3ZnPg=="
                    ]
                ], iovationToken: FraudForce.blackbox()
               )
           }

}
