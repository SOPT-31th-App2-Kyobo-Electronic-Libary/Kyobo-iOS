//
//  MainListResponse.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/22.
//

import Foundation

// MARK: - MainBooklist
struct MainBooklist: Codable, Hashable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable,Hashable {
    let lendingBook: [LendingBook]
    let bestBook : [BestBook]
    let newBook : [NewBook]
    let categoryBook: [Category]
}
// MARK: - LendingBook
struct LendingBook: Codable ,Hashable{
    let id: Int
    let name: String
    let image: String
    let lendingDate, returnDate: String
    let dDay: Int
}

// MARK: - BestBook
struct BestBook: Codable ,Hashable{
    let id: Int
    let name: String
    let image: String
    let author: String
    let bookDescription : String
    enum CodingKeys: String, CodingKey {
        case id, name, image, author
        case bookDescription = "description"
    }
}
// MARK: - NewBook
struct NewBook: Codable ,Hashable{
    let id: Int
    let name: String
    let image: String
    let author: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, image, author
    }
}
// MARK: - Category
struct Category: Codable,Hashable {
    let id: Int
    let name: String
    let image: String
    let author: String
    let category: String

    enum CodingKeys: String, CodingKey {
        case id, name, image, author
        case category
    }
}
