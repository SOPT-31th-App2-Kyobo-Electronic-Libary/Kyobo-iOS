//
//  RecentCell.swift
//  31st_Joint_Seminar
//
//  Created by 김민서 on 2022/11/25.
//

import UIKit
import Then
import SnapKit

// MARK: - RecentCell

final class RecentCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
//    static let identifier = "RecentCell"
    static var reuseId : String = "RecentCell"
    
    // MARK: - UI Components
    
    private lazy var vStack = UIStackView(arrangedSubviews: [bookImageView, univLabel, titleLabel, authorLabel]).then{
        $0.axis = .vertical
        $0.spacing = 4
    }
    
    private lazy var bookImageView = UIImageView().then {
        $0.backgroundColor = Color.kybo_light_gray
        $0.image = UIImage(named: "LibrarySearch/bookImage1")
    }
    
    private lazy var univLabel = UILabel().then {
        $0.textColor = Color.kybo_green
        $0.text = "홍익대학교"
        $0.font = .kyoboIosBody3
        $0.numberOfLines = 1
        $0.textAlignment = .left
    }
    
    private lazy var titleLabel = UILabel().then {
        $0.textColor = Color.kybo_black
        $0.text = "프로그래머를 위한 강화 학습"
        $0.font = .kyoboIosH5
        $0.numberOfLines = 2
        $0.textAlignment = .left
    }
    
    private lazy var authorLabel = UILabel().then {
        $0.textColor = Color.kybo_black
        $0.text = "멀티코어"
        $0.font = .kyoboIosBody4
        $0.textAlignment = .left
    }
    
    // MARK: - Life Cycles
    
    override init(frame :CGRect){
        super.init(frame: .zero)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension RecentCell {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        self.addSubview(vStack)

        vStack.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        bookImageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(138)
        }
        
        univLabel.snp.makeConstraints {
            $0.top.equalTo(bookImageView.snp.bottom).offset(8)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(univLabel.snp.bottom).offset(3)
        }
        
        authorLabel.snp.makeConstraints {
            $0.top.equalTo(univLabel.snp.bottom).offset(42)
        }
    }
    
    // MARK: - General Helpers
        
    func config(_ item : RecentModel) {
        titleLabel.text = item.title
        authorLabel.text = item.author
        bookImageView.image = UIImage(named: item.bookImage)
    }
}

