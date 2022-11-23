//
//  BestCell.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import UIKit
import SnapKit
import Then
class BestCell: UICollectionViewCell {
    static var reuseId : String = "BestCell"
    private lazy var bookImg = UIImageView().then {
        $0.backgroundColor = Color.kybo_light_gray
        $0.image = UIImage(named: "sample")
    }
    private lazy var numLabel = CustomLabel(padding: UIEdgeInsets(top: 4, left: 7, bottom: 3, right: 10)).then{
        $0.backgroundColor = Color.kybo_green
        $0.text = "1"
        $0.textColor = .white
        $0.font = .kyoboIosBody5
        $0.textAlignment = .center
    }
    private lazy var vStack = UIStackView(arrangedSubviews: [titleLabel,nameLabel,subTitleLabel]).then{
        $0.axis = .vertical
        $0.spacing = 4
    }
    private lazy var titleLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "빠르게 실패하기"
        $0.font = .kyoboIosH5
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    private lazy var nameLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .kyoboIosBody4
        $0.text = "존 크럼볼츠"
        $0.textAlignment = .left
    }
    private lazy var subTitleLabel = UILabel().then{
        $0.textColor = .black
        $0.text = "2023년 준비를 위한 트렌드 필독서"
        $0.font = .kyoboIosBody3
        $0.numberOfLines = 0
        $0.textAlignment = .left
    }
    func updateData( best: BestBook!){
        self.numLabel.text = "\(best.id)"
        self.bookImg.kf.setImage(with: URL(string: best.image), placeholder: UIImage(systemName: "hands.sparkles.fill"))
        self.titleLabel.text = best.name
        self.nameLabel.text = best.author
        self.subTitleLabel.text = best.bookDescription
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
        self.addSubview(bookImg)
        bookImg.addSubview(numLabel)
        self.addSubview(vStack)
        self.layer.borderWidth = 1
        self.layer.borderColor = Color.kybo_light_gray?.cgColor
    }
    func setConstraints(){
        vStack.snp.makeConstraints {
            $0.leading.equalTo(bookImg.snp.trailing).offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
            $0.top.equalTo(bookImg.snp.top)
            $0.bottom.equalTo(bookImg.snp.bottom)
        }
        bookImg.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(80)
            $0.width.equalTo(62)
        }
        numLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
        }
        
    }
}
