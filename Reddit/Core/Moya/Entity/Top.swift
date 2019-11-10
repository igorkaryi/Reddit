//
//  Top.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import ObjectMapper

struct Top {
    var kind : String?
    var data : DataModel?
}

extension Top: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        kind <- map["kind"]
        data <- map["data"]
    }
    
}
