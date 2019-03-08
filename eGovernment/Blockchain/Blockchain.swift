//
//  Blockchain.swift
//  eGovernment
//
//  Created by Marcelo on 08/03/2019.
//  Copyright © 2019 Marcelo. All rights reserved.
//

import UIKit

class Blockchain{
    
    var chain = [Block]()
    
    func createGenesisBlock(data:String) {
        let genesisBlock = Block()
        genesisBlock.hash = genesisBlock.generateHash()
        genesisBlock.data = data
        genesisBlock.previousHash = "0000"
        genesisBlock.index = 0
        chain.append(genesisBlock)
    }
    
    func createBlock(data:String) {
        let newBlock = Block()
        newBlock.hash = newBlock.generateHash()
        newBlock.data = data
        newBlock.previousHash = chain[chain.count-1].hash
        newBlock.index = chain.count
        chain.append(newBlock)
    }
    
}
