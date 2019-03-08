//
//  Block.swift
//  eGovernment
//
//  Created by Marcelo on 08/03/2019.
//  Copyright © 2019 Marcelo. All rights reserved.
//

import UIKit

class Block {
    var hash: String!
    var data: String!
    var previousHash: String!
    var index: Int!
    
    func generateHash() -> String {
        return NSUUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
    
}
