//
//  Children.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import ObjectMapper

struct Children {
    var kind : String?
    var data : DataChildren?
}

extension Children: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        kind <- map["kind"]
        data <- map["data"]
    }
    
}
