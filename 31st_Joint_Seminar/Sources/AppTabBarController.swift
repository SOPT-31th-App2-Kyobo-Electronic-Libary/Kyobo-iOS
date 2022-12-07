//
//  AppTabBarController.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/12.
//

import UIKit
import SnapKit
import Then

final class AppTabBarController: UITabBarController {

    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        setTabBarItemStyle()
    }
    
    // TabBarItem 생성해 주는 메서드
    private func makeTabVC(vc: UIViewController, tabBarTitle: String, tabBarImg: String, tabBarSelectedImg: String) -> UIViewController {
        
        vc.tabBarItem = UITabBarItem(title: tabBarTitle,
                                     image: UIImage(named: tabBarImg)?.withRenderingMode(.alwaysOriginal),
                                     selectedImage: UIImage(named: tabBarSelectedImg)?.withRenderingMode(.alwaysOriginal))
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        vc.tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.font: UIFont.kyoboIosBody6], for: .normal)
        return vc
    }
    
    /// TabBarItem을 지정하는 메서드
    private func setTabBar() {
        self.delegate = self
        let homeTab = makeTabVC(vc: BaseNC(rootViewController: HomeVC()), tabBarTitle: "홈", tabBarImg:"home_icon", tabBarSelectedImg: "home_selected_icon")
        homeTab.tabBarItem.tag = 0
        
        let categoryTab = makeTabVC(vc: BaseNC(rootViewController: CategroyVC()), tabBarTitle: "카테고리", tabBarImg: "category_icon", tabBarSelectedImg: "category_selected_icon")
        categoryTab.tabBarItem.tag = 1
        
        let libraryTab = makeTabVC(vc: BaseNC(rootViewController: LibrarySearchVC()), tabBarTitle: "도서관 검색", tabBarImg: "library_search_icon", tabBarSelectedImg: "library_search_icon")
        libraryTab.tabBarItem.tag = 2
        libraryTab.tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 12, right: 0)
        
        let notificationTab = makeTabVC(vc: BaseNC(rootViewController: NotificationVC()), tabBarTitle: "알림함", tabBarImg: "notificationBox_icon", tabBarSelectedImg: "notificationBox_selected_icon")
        notificationTab.tabBarItem.tag = 3
        
        let myPageTab = makeTabVC(vc: BaseNC(rootViewController: MyPageVC()), tabBarTitle: "내 서재", tabBarImg: "myPage_icon", tabBarSelectedImg: "myPage_selected_icon")
        myPageTab.tabBarItem.tag = 4
        
        let tabs = [homeTab, categoryTab,libraryTab, notificationTab, myPageTab]
        self.setViewControllers(tabs, animated: false)
    }
    
    private func setTabBarItemStyle() {
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
        
        let tabBarAppearance = UITabBarAppearance()
        let tabBarItemAppearance = UITabBarItemAppearance()

        tabBarItemAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Color.kybo_black as Any]
        tabBarItemAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Color.kybo_green as Any ]

        tabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        tabBar.standardAppearance = tabBarAppearance
    }
    
}
extension AppTabBarController: UITabBarControllerDelegate {
    
}

extension CALayer {
    // Sketch 스타일의 그림자를 생성하는 유틸리티 함수
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4
    ) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
    }
}

extension UITabBar {
    // 기본 그림자 스타일을 초기화해야 커스텀 스타일을 적용할 수 있음
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
