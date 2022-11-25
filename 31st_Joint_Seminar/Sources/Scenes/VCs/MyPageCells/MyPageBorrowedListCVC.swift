//
//  MyPageBorrowedListCVC.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/25.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class MyPageBorrowedListCVC: UICollectionViewCell {
    static var reuseID: String = "MyPageBorrowedListCVC"
    
    var bookData : MainBooklist?
    
    
    
    private lazy var bookImg = UIImageView().then {
        $0.image = R.image.sampleBook_img()
    }
    
    // c
    private lazy var dDayLabel = CustomLabel(padding: UIEdgeInsets(top: 4, left: 7, bottom: 3, right: 10)).then{
        $0.text = "D-1"
        $0.textColor = .red
        $0.font = .kyoboIosH3
    }
    
    private lazy var bookTitle = UILabel().then {
        $0.textColor = Color.kybo_black
        $0.font = .kyoboIosH3
        $0.text = "쿠쿠루 삥뽕"
        $0.textAlignment = .left
    }
    
    private lazy var borrowDate = UILabel().then {
        $0.text = "2022.11.03"
        $0.font = .kyoboIosBody4
        $0.textColor = Color.kybo_gray
    }
    
    private lazy var returnDate = UILabel().then {
        $0.text = "2022.11.03"
        $0.font = .kyoboIosBody4
        $0.textColor = Color.kybo_gray
    }
    
    private lazy var renewalBtn = UIButton().then {
        $0.setTitle("연장하기", for: .normal)
        $0.titleLabel?.textColor = Color.kybo_black
        $0.titleLabel?.font = .kyoboIosBody2
        $0.backgroundColor = Color.kybo_white
        $0.layer.cornerRadius = 8
        $0.layer.borderColor = Color.kybo_green?.cgColor
        $0.layer.borderWidth = 1
    }
    private lazy var returnBtn = UIButton().then {
        $0.setTitle("반납하기", for: .normal)
        $0.titleLabel?.textColor = Color.kybo_white
        $0.titleLabel?.font = .kyoboIosBody2
        $0.backgroundColor = Color.kybo_green
        $0.layer.cornerRadius = 8
    }
    
    private lazy var vStack = UIStackView(arrangedSubviews: [dDayLabel, bookTitle, borrowDate, returnDate, btnStack]).then {
        $0.axis = .vertical
        $0.alignment = .leading
    }
    
    private lazy var btnStack = UIStackView(arrangedSubviews: [renewalBtn, returnBtn]).then {
        $0.axis = .horizontal
        $0.alignment = .fill
    }
    
    
    // MARK: - initialize
    override init(frame :CGRect){
        super.init(frame: .zero)
        setupViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Function
    func updateData(borrowInfo: LendingBook!) {
        self.bookImg.kf.setImage(with: URL(string: borrowInfo.image), placeholder: UIImage(systemName: "hands.sparkles.fill" ))
        self.dDayLabel.text = "D-\(borrowInfo.dDay)"
        self.bookTitle.text = borrowInfo.name
        self.borrowDate.text = borrowInfo.lendingDate
        self.returnDate.text = borrowInfo.returnDate
    }
    
    func setupViews(){
        
        [bookImg, vStack].forEach {
            self.addSubview($0)
        }
        
    }
    func setLayout(){
        bookImg.snp.makeConstraints {
            $0.leading.top.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        vStack.snp.makeConstraints {
            $0.leading.equalTo(bookImg.snp.trailing).offset(24)
            $0.top.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        ///vStack Layout
        dDayLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(16)
        }
        bookTitle.snp.makeConstraints {
            $0.top.equalTo(dDayLabel.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
            $0.height.equalTo(18)
        }
        borrowDate.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(bookTitle.snp.bottom).offset(7)
            $0.height.equalTo(16)
        }
        returnDate.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalTo(bookTitle.snp.bottom).offset(7)
            $0.height.equalTo(16)
        }
        btnStack.snp.makeConstraints {
            $0.top.equalTo(returnDate.snp.bottom).offset(12)
            $0.directionalHorizontalEdges.equalToSuperview()
        }
    }
}
