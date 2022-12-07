//
//  MyPageService.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/25.
//

import Foundation
import Moya

enum MyPageService {
    case myDetailList
}

extension MyPageService : TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    var path: String {
        switch self {
        case .myDetailList:
            return "user/1/lending"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .myDetailList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .myDetailList:
            return .requestPlain
        }
    }
    var validationType: Moya.ValidationType {
           return .successAndRedirectCodes
       }
    
    var headers: [String: String]? {
        return Environment.Header.applicationJsonHeader()
      }
    }



