//
//  BookDetailServices.swift
//  31st_Joint_Seminar
//
//  Created by 김민서 on 2022/11/25.
//

import Foundation
import Moya

enum BookDetailService {
    case bookDetailList
}

extension BookDetailService : TargetType {
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    var path: String {
        switch self {
        case .bookDetailList:
            return "book/1"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .bookDetailList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .bookDetailList:
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
