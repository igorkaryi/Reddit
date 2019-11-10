//
//  MainViewModel.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import Moya
import Moya_ObjectMapper

class MainViewModel: MainProtocol {
    
    private let service = MoyaProvider<MoyaService>()
    
    func getTopFeed(limit: Int, completion: @escaping (([Children]?, _ error: Error?) -> Void)) {
        service.request(.top(limit: limit)) { [weak self] (result) in
            switch result {
            case .success(let response):
                let data = try? response.mapObject(Top.self).data
                let children = data?.children
                completion(children, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

}
