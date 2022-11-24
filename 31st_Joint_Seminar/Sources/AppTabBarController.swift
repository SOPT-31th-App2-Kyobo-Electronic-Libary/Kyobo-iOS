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
        return vc
    }
    
    /// TabBarItem을 지정하는 메서드
    private func setTabBar() {
        self.delegate = self
        let homeTab = makeTabVC(vc: BaseNC(rootViewController: HomeVC()), tabBarTitle: "홈", tabBarImg:"home_icon", tabBarSelectedImg: "home_selected_icon")
        homeTab.tabBarItem.tag = 0
        
        let categoryTab = makeTabVC(vc: BaseNC(rootViewController: CategroyVC()), tabBarTitle: "카테고리", tabBarImg: "category_icon", tabBarSelectedImg: "category_selected_icon")
        categoryTab.tabBarItem.tag = 1
        
        let libraryTab = makeTabVC(vc: BaseNC(rootViewController: LibrarySearchVC()), tabBarTitle: "", tabBarImg: "library_search_icon", tabBarSelectedImg: "library_search_icon")
        libraryTab.tabBarItem.tag = 2
        libraryTab.tabBarItem.imageInsets = UIEdgeInsets(top: -7, left: 0, bottom: 9, right: 0)
        
        let notificationTab = makeTabVC(vc: BaseNC(rootViewController: NotificationVC()), tabBarTitle: "알림함", tabBarImg: "notificationBox_icon", tabBarSelectedImg: "notificationBox_selected_icon")
        notificationTab.tabBarItem.tag = 3
        
        let myPageTab = makeTabVC(vc: BaseNC(rootViewController: MyPageVC()), tabBarTitle: "내 서재", tabBarImg: "myPage_icon", tabBarSelectedImg: "myPage_selected_icon")
        myPageTab.tabBarItem.tag = 4
        
        let tabs = [homeTab, categoryTab,libraryTab, notificationTab, myPageTab]
        self.setViewControllers(tabs, animated: false)
    }
    
    private func setTabBarItemStyle() {
        tabBar.tintColor = .kyobo_green
        tabBar.backgroundColor = .white
    }
    
}
extension AppTabBarController: UITabBarControllerDelegate {
    
}
