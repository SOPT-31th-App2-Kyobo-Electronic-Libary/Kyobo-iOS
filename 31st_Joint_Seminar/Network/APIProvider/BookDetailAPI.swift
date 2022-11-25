//
//  BookDetailAPI.swift
//  31st_Joint_Seminar
//
//  Created by 김민서 on 2022/11/25.
//

import Foundation
import Moya

public class BookDetailAPI {
    let dataProvider = MoyaProvider<BookDetailService>(plugins:[NetworkLoggerPlugin(verbose: true)])
}

