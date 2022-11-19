//
//  FieldCell.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import UIKit
import Then
import SnapKit
class FieldCell: UICollectionViewCell {
    static var reuseId : String = "FieldCell"
    private lazy var vStack = UIStackView(arrangedSubviews: [bookImg,titleLabel,nameLabel]).then{
        $0.axis = .vertical
        $0.spacing = 4
    }
    private lazy var bookImg = UIImageView().then {
        $0.backgroundColor = Color.kybo_light_gray
        $0.image = UIImage(named: "sample")
    }
    private lazy var titleLabel = UILabel().then {
        $0.textColor = Color.kybo_black
        $0.text = "트렌드 코리아 2023"
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.numberOfLines = 1
        $0.textAlignment = .left
    }
    private lazy var nameLabel = UILabel().then {
        $0.textColor = Color.kybo_black
        $0.text = "김난도"
        $0.textAlignment = .left
    }
    func config(_ item : FieldItem){
        self.bookImg.image = UIImage(named: item.img)
        self.titleLabel.text = item.title
        self.nameLabel.text = item.name
    }
    override init(frame :CGRect){
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setViews(){
        self.addSubview(vStack)
    }
    func setConstraints(){
        vStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        bookImg.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(138)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(bookImg.snp.bottom).offset(8)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
    }
}

