//
//  HeaderView.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import UIKit
import Then
import SnapKit
class HeaderView: UICollectionReusableView {
    static var reuseId : String = "HeaderView"
    private lazy var titleLabel = UILabel().then{
        $0.font = .kyoboIosH1
    }
    
    private lazy var btn = UIButton(configuration: .plain()).then{
        $0.configuration?.titleAlignment = .trailing
        $0.titleLabel?.font = .kyoboIosBody4
        $0.configuration?.baseForegroundColor = Color.kybo_black
        $0.configuration?.imagePadding = 10
        $0.configuration?.imagePlacement = NSDirectionalRectEdge.trailing
        $0.configuration?.buttonSize = .small
        $0.configuration?.baseBackgroundColor = .clear
        $0.configuration?.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 0, bottom: 0, trailing: 0)
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func HeaderTitle(title : String?){
        self.titleLabel.text = title
    }
    func BtnWithIcon(title: String?, icon : String?){
        self.btn.configuration?.title = title
        self.btn.configuration?.image = UIImage(named: icon ?? "")
    }
   
    func setViews(){
        self.addSubview(titleLabel)
        self.addSubview(btn)
    }
    func setConstraints(){
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        btn.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}

