//
//  MoyaService.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import Moya

enum MoyaService {
    case top(limit: Int)
}

extension MoyaService: TargetType {
    
    var baseURL: URL { return URL(string: "https://www.reddit.com")! }
    
    var path: String {
        switch self {
        case .top: return "/top.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .top:
            return .get
        }
    }
    
    var task: Task {
        if let requestParameters = parameters {
            return .requestParameters(parameters: requestParameters, encoding: parameterEncoding)
        }
        return .requestPlain
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return nil        
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .top(let limit):
            return ["limit": limit]
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
}
