//
//  BtnType.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import Foundation
enum BtnType {
    case returnBook, borrowBook
    var title : String {
        switch self {
        case .returnBook:
            return "반납"
        case .borrowBook :
            return "희망도서 신청하기"
        }
    }
}
