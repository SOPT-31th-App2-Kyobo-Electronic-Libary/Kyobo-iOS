//
//  NewCell.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//
import UIKit
import Then
import SnapKit

class NewCell: UICollectionViewCell {
    static var reuseId :String = "NewCell"
    private lazy var vStack = UIStackView(arrangedSubviews: [bookImg,titleLabel,nameLabel]).then{
        $0.axis = .vertical
        $0.spacing = 8
    }
    private lazy var bookImg = UIImageView().then {
        $0.image = UIImage(named: "sample")
    }
    private lazy var titleLabel = UILabel().then {
        $0.textColor = Color.kybo_black
        $0.text = "빠르게 실패하기"
        $0.font = .kyoboIosH5
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    private lazy var nameLabel = UILabel().then {
        $0.textColor = Color.kybo_dark_gray
        $0.text = "존 크럼볼츠"
        $0.textAlignment = .left
        $0.font = .kyoboIosBody4
    }
    func updateData(new :  NewBook!){
        self.bookImg.kf.setImage(with: URL(string: new.image), placeholder: UIImage(systemName: "hands.sparkles.fill"))
        self.titleLabel.text = new.name
        self.nameLabel.text = new.author
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
            $0.height.equalTo(35)
        }
    }
}



