//
//  Header.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/22.
//

import Foundation

extension  Environment {
    struct Header {
        //request
        static func applicationJsonHeader() -> [String: String] {
            ["Content-Type": "application/json"]
        }
    }
}

