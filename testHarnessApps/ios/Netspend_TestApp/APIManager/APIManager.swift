import Foundation
import UIKit
import NetspendSdk
import FraudForce


final class APIManager {
    
    //@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var env: String
    
    init(env: String) {
        self.env = env
    }
    
    static let sharedWebClient = WebClient.init(baseUrl: "https://api-netspend-01.cert.aus.netspend.net")
    
    private func showErrorAlert(with message: String) {
        DispatchQueue.main.async {
            NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: "progressComplete")))
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            var rootViewController = UIApplication.shared.keyWindow?.rootViewController
            if let navigationController = rootViewController as? UINavigationController {
                
                navigationController.popToViewController(navigationController.viewControllers[3] as! DashboardViewController,animated: true)
                rootViewController =  navigationController.viewControllers[3] as! DashboardViewController
            }
            rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
     
       
    private func handleError(_ error: WebError<CustomError>) {
           switch error {
           case .noInternetConnection:
               showErrorAlert(with: "The internet connection is lost")
           case .unauthorized:
               showErrorAlert(with: "Unfortunately something went wrong")
           case .other:
               showErrorAlert(with: "Unfortunately something went wrong, Please try again later")
           case .custom(let error):
              showErrorAlert(with: error.message)
           }
    }
    
    private func moveToLogin() {
        showErrorAlert(with: "Unfortunately something went wrong")
    }}
    

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
