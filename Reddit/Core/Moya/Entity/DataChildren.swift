//
//  DataChildren.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import ObjectMapper

struct DataChildren {
    var title: String?
    var author: String?
    var created: Date?
    var thumbnail: String?
    var numComments: Int?
}

extension DataChildren: Mappable {
    
    init?(map: Map) {}
    
    // Mappable
    mutating func mapping(map: Map) {
        author <- map["author"]
        title <- map["title"]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        if let date = map["created"].currentValue as? Int {
            created = unixTimeToDate(date)
        }

        thumbnail <- map["thumbnail"]
        numComments <- map["num_comments"]
    }

    private func unixTimeToDate(_ time: Int) -> Date {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        return date
    }
    
}
