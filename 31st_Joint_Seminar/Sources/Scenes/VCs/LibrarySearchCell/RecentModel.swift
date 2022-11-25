//
//  RecentModel.swift
//  31st_Joint_Seminar
//
//  Created by 김민서 on 2022/11/25.
//

import Foundation

struct RecentModel : Hashable {
    let bookImage: String
    let title: String
    let author: String
}
extension RecentModel {
    static var recentList : [RecentModel] = [
        RecentModel(bookImage: "LibrarySearch/bookImage1", title: "프로그래머를 위한 강화 학습", author: "멀티코어"),
        RecentModel(bookImage: "LibrarySearch/bookImage2", title: "오직 두 사람", author: "김영하"),
        RecentModel(bookImage: "LibrarySearch/bookImage3", title: "데미안", author: "헤르만 헤세"),
        RecentModel(bookImage: "LibrarySearch/bookImage4", title: "지적 대화를 위한 넓고 얕은 지식", author: "채사장")
    ]
 }
