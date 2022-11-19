//
//  FooterView.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import UIKit
import Then
import SnapKit
class FooterView: UICollectionReusableView {
    static var reuseId : String = "FooterView"
    private lazy var btn = CustomBtn(type: .borrowBook, borderColor: Color.kybo_black!, titleColor: Color.kybo_black!,font: .systemFont(ofSize: 16)).then {
        $0.setTitle(BtnType.borrowBook.title, for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setViews(){
        self.addSubview(btn)
    }
    func setConstraints(){
        btn.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview()
            $0.height.equalTo(50)
        }
    }
}
