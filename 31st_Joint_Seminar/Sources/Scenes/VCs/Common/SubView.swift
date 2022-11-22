//
//  SubView.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import UIKit
import Then
import SnapKit

class SubView : UIView{
    private lazy var hStack = UIStackView(arrangedSubviews: [icon,titleLabel]).then{
        $0.axis = .horizontal
        $0.spacing = 7
    }
    private lazy var icon = UIImageView().then{
        $0.image = UIImage(named: "Home/Star ")
    }
    private lazy var titleLabel = UILabel().then {
        $0.text = "홍익대학교"
        $0.textColor = Color.kybo_black
        $0.font = .kyoboIosH2
    }
    private lazy var magnifyBtn = UIButton().then{
        $0.setImage(UIImage(named: "Home/magnify"), for: .normal)
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
        self.addSubview(hStack)
        self.addSubview(magnifyBtn)
    }
    func setConstraints(){
        hStack.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(28)
        }
        icon.snp.makeConstraints {
            $0.height.width.equalTo(20)
        }
        magnifyBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-27)
            $0.width.height.equalTo(18)
        }
    }
}
