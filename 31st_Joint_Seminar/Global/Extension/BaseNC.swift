//
//  BaseNC.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/14.
//

import UIKit

class BaseNC: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isHidden = true
        interactivePopGestureRecognizer?.delegate = self
    }
}


extension BaseNC: UIGestureRecognizerDelegate {
    
    /// NavigationBar를 안 쓰고 UIView로 네비바를 구현할 때, 스와이프로 뒤로 가기 가능하게 함
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.viewControllers.count > 1
    }
}
