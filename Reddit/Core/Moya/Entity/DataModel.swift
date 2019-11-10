//
//  Data.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import ObjectMapper

struct DataModel {
    var modhash : String?
    var dist : Int?
    var children : [Children]?
    var after : String?
    var before : String?
}

extension DataModel: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        modhash <- map["modhash"]
        dist <- map["dist"]
        children <- map["children"]
        after <- map["after"]
        before <- map["before"]
    }
    
}
