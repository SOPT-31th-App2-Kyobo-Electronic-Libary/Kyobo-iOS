//
//  MyPageResponse.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/25.
//

import Foundation

// MARK: - MainBooklist
struct MyPageList: Codable, Hashable {
    let status: Int
    let success: Bool
    let message: String
    let data: MyPageData
}
// MARK: - DataClass
struct MyPageData: Codable,Hashable {
    let userId: Int
    let userName: String
    let books: [UserLendingInfo]
}
// MARK: - LendingBook
struct UserLendingInfo: Codable ,Hashable{
    let id: Int
    let name: String
    let image: String
    let lendingDate, returnDate: String
    let dDay: Int
}

