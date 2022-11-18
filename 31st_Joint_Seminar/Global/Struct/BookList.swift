//
//  BookList.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import Foundation
struct BorrowItem : Hashable{
    var img : String
    var title : String
    var date : String
}
extension BorrowItem {
    static var item : [BorrowItem] = [BorrowItem(img: "Home/sample", title: "오직 두 사람 ",date: "D-1"),
                                      BorrowItem(img: "Home/sample", title: "미움받을 용기",date: "D-3"),
                                      BorrowItem(img: "Home/sample", title: "부자의 그릇", date: "D-3"),
                                      BorrowItem(img: "Home/sample", title: "데미안", date: "D-3")
    ]
}
struct BestItem : Hashable{
    var id :Int
    var img :String
    var title : String
    var name : String
    var subTitle : String
}
extension BestItem {
    static var item :[BestItem] = [BestItem(id : 1,img: "Home/sample", title: "트렌드 코리아 2023", name: "김난도", subTitle: "2023년 준비를 위한 트렌드 필독서"),
                                   BestItem(id : 2,img: "Home/sample", title: "불편한 편의점", name: "김호연", subTitle: "원 플러스 원의 기쁨, 삼각김밥 모양의 슬픔"),
                                   BestItem(id : 3,img: "Home/sample", title: "작별인사", name: "김영하", subTitle: "살인자의 기억법 이후로 9년만에 내놓은 장"),
                                   BestItem(id : 4,img: "Home/sample", title: "달러구트", name: "이미예", subTitle: "잠들어야만 입장 가능한 꿈 백화점에서 일어나는")
    ]
}
struct NewItem : Hashable{
    var img :String
    var title : String
    var name : String
   
}
extension NewItem {
    static var item :[NewItem] = [NewItem(img: "Home/sample", title: "빠르게 실패하기", name: "존 크럼볼츠"),
                                  NewItem(img: "Home/sample", title: "30days 상황별 영어 회화 표현", name: "김지환"),
                                  NewItem(img: "Home/sample", title: "투자에도 순서가 있다", name: "홍춘옥"),
                                  NewItem(img: "Home/sample", title: "작은 땅의 야수들", name: "김주혜")
    ]
}
struct FieldItem : Hashable{
    var img :String
    var title : String
    var name : String
   
}
extension FieldItem {
    static var item :[FieldItem] = [FieldItem(img: "Home/sample", title: "트렌드 코리아 2023", name: "김난도"),
                                    FieldItem(img: "Home/sample", title: "부자 아빠 가난 ", name: "로버트 기요사키"),
                                    FieldItem(img: "Home/sample", title: "부자의 그릇", name: "이즈미 마사토"),
                                    FieldItem(img: "Home/sample", title: "자이언트", name: "박종훈")
    ]
}
struct NewBookList :Hashable {
    var title : String
}
extension NewBookList {
    static var title : [NewBookList] = [NewBookList(title: "전체"),
                                        NewBookList(title: "국내도서"),
                                        NewBookList(title: "외국도서"),
                                        NewBookList(title: "ebook"),
                                        NewBookList(title: "논문"),
                                        NewBookList(title: "기타")
                                        
    ]
}
