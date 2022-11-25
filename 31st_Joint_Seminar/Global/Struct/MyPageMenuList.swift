//
//  MyPageMenuList.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/24.
//

import Foundation

struct MyPageMenuList :Hashable {
    var title : String
}
extension MyPageMenuList {
    static var titles : [MyPageMenuList] = [MyPageMenuList(title: "대출 목록"),
                                        MyPageMenuList(title: "예약 목록"),
                                        MyPageMenuList(title: "찜한 도서"),
                                        MyPageMenuList(title: "대출 이력"),
                                        MyPageMenuList(title: "리뷰")
    ]
}
