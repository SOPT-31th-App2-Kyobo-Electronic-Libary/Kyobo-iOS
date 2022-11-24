//
//  temp.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/13.
//

import Foundation
import Moya

enum MainRouter {
    case mainBookList
}

extension MainRouter : TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    var path: String {
        switch self {
        case .mainBookList :
           return "/user/1/main"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .mainBookList :
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .mainBookList :
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


