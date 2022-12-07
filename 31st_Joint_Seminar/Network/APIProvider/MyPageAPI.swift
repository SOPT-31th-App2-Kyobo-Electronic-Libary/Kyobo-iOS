//
//  MyPageAPI.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/25.
//

import Foundation
import Moya

public class MyPageAPI {
    let dataProvider = MoyaProvider<MyPageService>(plugins:[NetworkLoggerPlugin(verbose: true)])
}
