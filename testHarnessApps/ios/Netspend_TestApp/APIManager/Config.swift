//
//  Config.swift
//  Netspend
//
//  Created by Hitesh Batra on 06/08/20.
//  Copyright © 2020 Hitesh Batra. All rights reserved.
//

import UIKit

struct TestEnv : Codable {
  let baseUrl : String
  let client_secret : String
}


struct ConfigValues {
    static func get(env: String) -> TestEnv {
        do {
                   let dict = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "config", ofType: "plist")!)?.object(forKey: env)
                   let jsonData: NSData = try! JSONSerialization.data(withJSONObject: dict as Any, options: JSONSerialization.WritingOptions.prettyPrinted) as NSData
                   let decoder = JSONDecoder()
                   return try decoder.decode(TestEnv.self, from: jsonData as Data)
            }catch let err{
                   fatalError(err.localizedDescription)
        }
    }
}
