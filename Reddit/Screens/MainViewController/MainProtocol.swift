//
//  MainProtocol.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import Foundation

protocol MainProtocol: class {
    
    func getTopFeed(limit: Int, completion: @escaping (([Children]?, _ error: Error?) -> Void))
    
}
