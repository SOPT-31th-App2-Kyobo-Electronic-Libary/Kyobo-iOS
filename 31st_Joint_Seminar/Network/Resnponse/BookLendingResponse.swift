//
//  LendingBookResponse.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/12/11.
//

import Foundation

struct BookLending : Codable, Hashable {
    let status: Int
    let success: Bool
    let message: String
}
