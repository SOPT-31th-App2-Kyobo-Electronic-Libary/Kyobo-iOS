//
//  BorrowCell.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import UIKit
import Then
import SnapKit

class BorrowCell: UICollectionViewCell {
    static var reuseId : String = "BorrowCell"
    private lazy var vStack = UIStackView(arrangedSubviews: [bookImg,titleLabel,btn]).then{
        $0.axis = .vertical
        $0.spacing = 8
    }
    private lazy var bookImg = UIImageView().then {
        $0.image = UIImage(named: "sample")
    }
    private lazy var dateLabel = CustomLabel(padding: UIEdgeInsets(top: 4, left: 7, bottom: 3, right: 10)).then{
        $0.backgroundColor = Color.kybo_green
        $0.text = "D-1"
        $0.textColor = .white
        $0.font = UIFont(name: "Roboto-Medium", size: 12)
    }
    private lazy var titleLabel = UILabel().then {
        $0.textColor = Color.kybo_black
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.text = "오직 두 사람"
        $0.textAlignment = .left
    }
    private lazy var btn = CustomBtn(type:.returnBook, borderColor: Color.kybo_green!, titleColor: Color.kybo_green!,font: .systemFont(ofSize: 14)).then{
        $0.setTitle(BtnType.returnBook.title, for: .normal)
    }
    func config(_ item : BorrowItem){
        self.bookImg.image = UIImage(named: item.img)
        self.titleLabel.text = item.title
        self.dateLabel.text = item.date
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
        bookImg.addSubview(dateLabel)
    }
    func setConstraints(){
        vStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        bookImg.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(138)
        }
        dateLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        btn.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(14)
        }
    }
}
