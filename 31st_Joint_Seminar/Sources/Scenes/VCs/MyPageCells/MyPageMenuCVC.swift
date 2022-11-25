//
//  MyPageMenuCVC.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/24.
//

import UIKit
import Then
import SnapKit

final class MyPageMenuCVC: UICollectionViewCell {
    static var reuseID: String  = "MyPageMenuCVC"
    
    private var title = UILabel().then {
        $0.textAlignment = .center
        $0.textColor = Color.kybo_gray
        $0.font = .kyoboIosBody1
    }
    
    func config(_ item: MyPageMenuList, index: IndexPath){
        self.title.text = item.title
    }
    
    /// 셀 선택시 폰트 변경
    override var isSelected: Bool {
      didSet {
        if !isSelected {
            self.title.textColor = Color.kybo_gray
            self.title.font = .kyoboIosBody1
        } else {
            self.title.textColor = Color.kybo_black
            self.title.font = .kyoboIosH3            
        }
      }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(title)
    }
    
    func setLayout() {
        title.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
