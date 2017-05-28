//
//  GankAPI.swift
//  Villon
//
//  Created by Bing on 2017/5/11.
//  Copyright © 2017年 Bing. All rights reserved.
//

import Foundation
import Moya
//import Alamofire

/*
 
 http://gank.io/api/day/history
 http://gank.io/api/day/2017/05/10
 
 809568764
 1031743547
 906021561
 209281278
 
 */

public enum GankAPI {
    case history
    case dateNews(String)
}
extension GankAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: "http://gank.io/api/")!

    }
    public var path: String {
        switch self {
        case .history:
            return "day/history"
        case .dateNews(let date):
            return "day/\(date)"
        
        }
    }
    public var method: Moya.Method {
        
        return .get
    }
    
    public var parameters: [String : Any]? {
        return nil
    }
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    public var sampleData: Data {
        return "test info".data(using: String.Encoding.utf8)!
    }
    public var task: Task {
        return .request
    }
    public var validate: Bool {
        return false
    }
    
}

let GankAPIProvider = MoyaProvider<GankAPI>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

// let GitHubProvider = MoyaProvider<GitHub>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])




