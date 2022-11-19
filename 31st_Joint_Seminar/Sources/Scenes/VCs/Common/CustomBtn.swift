//
//  CustomBtn.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//
import UIKit
import Then
import SnapKit
class CustomBtn : UIButton {
    var type : BtnType
    var borderColor : UIColor = Color.kybo_green!
    var titleColor : UIColor = Color.kybo_green!
    var font : UIFont = .systemFont(ofSize: 14)
    init(type: BtnType , borderColor : UIColor, titleColor : UIColor, font : UIFont) {
        self.type = type
        super.init(frame: .zero)
        self.borderColor = borderColor
        self.titleColor = titleColor
        self.font = font
        setStyle()
    }
    func setStyle(){
        self.layer.cornerRadius = 8
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = 1
        self.titleLabel?.font = self.font
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = Color.kybo_white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
