//
//  MoyaProvider.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/22.
//

import Foundation
import Moya

public class MainAPI {
    let bookProvider = MoyaProvider<MainRouter>(plugins:[NetworkLoggerPlugin(verbose: true)])
}

public class BookDetailAPI {
    let dataProvider = MoyaProvider<BookDetailService>(plugins:[NetworkLoggerPlugin(verbose: true)])
}

public class LendingBookAPI {
    let dataProvider = MoyaProvider<BookDetailService>(plugins:[NetworkLoggerPlugin(verbose: true)])
}
