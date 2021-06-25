//
//  SelectEnvironment.swift
//  Netspend
//
//  Created by Hitesh Batra on 16/07/20.
//  Copyright © 2020 Hitesh Batra. All rights reserved.
//

import UIKit

class SelectEnvironment {
    
    //MARK: Properties
    
    var env: String
    
    //MARK: Initialization
    
    init?(env: String) {
        
        // The name must not be empty
        guard !env.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.env = env
    }
}

