//
//  BookDetailVC.swift
//  31st_Joint_Seminar
//
//  Created by 김민서 on 2022/11/19.
//

import UIKit
import Then
import SnapKit

final class BookDetailVC: UIViewController {

    private lazy var containerView = UIScrollView().then {
        $0.bounces = false
        $0.showsVerticalScrollIndicator = false
    }
    
    private let bookImageContainerView = UIView().then {
        $0.backgroundColor = Color.kybo_green
    }
    
    private let bookImageView = UIImageView().then {
        $0.image = UIImage(named: "BookDetail/bookImage")
    }
    
    private let bookDataContainerView = UIView()
    
    private let univLabel = UILabel().then {
        $0.text = "홍익대학교"
        $0.textColor = Color.kybo_green
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let bookNameLabel = UILabel().then {
        $0.text = "단단한 심층강화학습"
        $0.textColor = Color.kybo_black
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private let publisherLabel = UILabel().then {
        $0.text = "멀티코어"
        $0.textColor = Color.kybo_green
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let verticalLineLabel = UILabel().then {
        $0.text = "|"
        $0.textColor = Color.kybo_green
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let publishingLabel = UILabel().then {
        $0.text = "멀티코어 출판사"
        $0.textColor = Color.kybo_green
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private let publishDateLabel = UILabel().then {
        $0.text = "2022.10.10"
        $0.textColor = Color.kybo_gray
        $0.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    private lazy var pdfButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "BookDetail/pdfImage"), for: .normal)
    }
    
    private let pdfCapacityLabel = UILabel().then {
        $0.text = "20MB"
        $0.textColor = Color.kybo_gray
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    private let menuLineLabel = UILabel().then {
        $0.backgroundColor = Color.kybo_black
    }
    
    private let bookMenuLabel = UILabel().then {
        $0.text = "책 소개"
        $0.textColor = Color.kybo_black
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private let publisherMenuLabel = UILabel().then {
        $0.text = "저자소개"
        $0.textColor = Color.kybo_gray
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private let contentsMenuLabel = UILabel().then {
        $0.text = "목차"
        $0.textColor = Color.kybo_gray
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private let reviewMenuLabel = UILabel().then {
        $0.text = "리뷰"
        $0.textColor = Color.kybo_gray
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private let aboutBookTextLabel = UILabel().then {
        $0.text = "이 책은 심층강화학습의 전체 과정을 소개한다. 직관을 제시하는 것부터 시작해서 이론과 알고리즘을 설명하고 실제 구현 및 실용적 조언으로 마무리한다. 이 책에서 SLM Lab이라는 라이브러리를 함께 제공하는 것도 바로 이러한 이유에서다. SLM Lab은 이 책에서 다룬 모든 알고리즘의 구현 코드를 포함한다. 한마디로 말하면, 이 책은 우리가 심층강화학습을 처음 공부할 때 있었으면 좋았을 것으로 생각했던 바로 그 책이다."
        $0.textColor = Color.kybo_dark_gray
        $0.numberOfLines = 10
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private let borrowContainerView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let borrowContainerLineLabel = UILabel().then {
        $0.backgroundColor = Color.kybo_gray
        $0.layer.opacity = 0.2
    }
    
    private let starButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "BookDetail/star"), for: .normal)
    }
    
    private let returnDateLabel = UILabel().then {
        $0.text = "2022.10.08"
        $0.textColor = Color.kybo_black
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }
    
    private let returnLabel = UILabel().then {
        $0.text = "반납예정"
        $0.textColor = Color.kybo_black
        $0.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
    private lazy var borrowButton = UIButton().then {
        $0.setTitle("대출하기", for: .normal)
        $0.setTitleColor(Color.kybo_white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        $0.backgroundColor = Color.kybo_green
        $0.layer.cornerRadius = 8
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
}

// MARK: - Extensions

extension BookDetailVC {
    
    // MARK: - Layout Helpers
    
    private func layout() {
        view.backgroundColor = .white
        [containerView, borrowContainerView].forEach {
            view.addSubview($0)
        }
        
        [bookImageContainerView, bookDataContainerView].forEach {
            containerView.addSubview($0)
        }
        
        bookImageContainerView.addSubview(bookImageView)
        
        [univLabel, bookNameLabel, publisherLabel, verticalLineLabel, publishingLabel, publishDateLabel, pdfButton, pdfCapacityLabel, menuLineLabel, bookMenuLabel, publisherMenuLabel, contentsMenuLabel, reviewMenuLabel, aboutBookTextLabel].forEach {
            bookDataContainerView.addSubview($0)
        }
        
        [borrowContainerLineLabel, starButton, returnDateLabel, returnLabel, borrowButton].forEach {
            borrowContainerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints {
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
        
        bookImageContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(292)
        }
        
        bookDataContainerView.snp.makeConstraints {
            $0.top.equalTo(self.bookImageContainerView.snp.bottom)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(500)
            $0.bottom.equalToSuperview().offset(-45) // 중요!
        }
        
        borrowContainerView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.height.equalTo(83)
        }
        
        bookImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(206)
            $0.width.equalTo(148)
        }
        
        univLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookDataContainerView.snp.top).offset(24)
            $0.leading.equalTo(self.bookDataContainerView.snp.leading).offset(27)
        }
        
        bookNameLabel.snp.makeConstraints {
            $0.top.equalTo(self.univLabel.snp.bottom).offset(7)
            $0.leading.equalTo(self.univLabel.snp.leading)
        }
        
        publisherLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookNameLabel.snp.bottom).offset(7)
            $0.leading.equalTo(self.univLabel.snp.leading)
        }
        
        verticalLineLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.publisherLabel.snp.centerY)
            $0.leading.equalTo(self.publisherLabel.snp.trailing).offset(5)
        }
        
        publishingLabel.snp.makeConstraints {
            $0.top.equalTo(self.publisherLabel.snp.top)
            $0.leading.equalTo(self.verticalLineLabel.snp.trailing).offset(5)
        }
        
        publishDateLabel.snp.makeConstraints {
            $0.top.equalTo(self.publisherLabel.snp.bottom).offset(7)
            $0.leading.equalTo(self.univLabel.snp.leading)
        }
        
        pdfButton.snp.makeConstraints {
            $0.top.equalTo(self.publishDateLabel.snp.bottom).offset(17)
            $0.leading.equalTo(self.univLabel.snp.leading)
            $0.height.equalTo(28)
            $0.width.equalTo(64)
        }
        
        pdfCapacityLabel.snp.makeConstraints {
            $0.top.equalTo(self.publishDateLabel.snp.bottom).offset(22)
            $0.leading.equalTo(self.pdfButton.snp.trailing).offset(10)
        }
        
        bookMenuLabel.snp.makeConstraints {
            $0.top.equalTo(self.pdfButton.snp.bottom).offset(22)
            $0.leading.equalTo(self.univLabel.snp.leading)
        }
        
        publisherMenuLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookMenuLabel.snp.top)
            $0.leading.equalTo(self.bookMenuLabel.snp.trailing).offset(24)
        }
        
        contentsMenuLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookMenuLabel.snp.top)
            $0.leading.equalTo(self.publisherMenuLabel.snp.trailing).offset(24)
        }
        
        reviewMenuLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookMenuLabel.snp.top)
            $0.leading.equalTo(self.contentsMenuLabel.snp.trailing).offset(24)
        }
        
        menuLineLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookMenuLabel.snp.bottom).offset(8)
            $0.centerX.equalTo(self.bookMenuLabel.snp.centerX)
            // $0.trailing.equalTo(self.bookDataContainerView.snp.trailing).offset(-313)
            $0.height.equalTo(3)
            $0.width.equalTo(50)
        }
        
        aboutBookTextLabel.snp.makeConstraints {
            $0.top.equalTo(self.bookMenuLabel.snp.bottom).offset(35)
            $0.leading.trailing.equalTo(self.bookDataContainerView).inset(27)
        }
        
        borrowContainerLineLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        starButton.snp.makeConstraints {
            $0.top.equalTo(self.borrowContainerView.snp.top).offset(25.94)
            $0.leading.equalTo(self.borrowContainerView.snp.leading).offset(23)
            $0.height.equalTo(25)
            $0.width.equalTo(25)
        }

        returnDateLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.starButton.snp.centerY).offset(-2.5)
            $0.leading.equalTo(self.starButton.snp.trailing).offset(14)
        }

        returnLabel.snp.makeConstraints {
            $0.top.equalTo(self.starButton.snp.centerY).offset(2.5)
            $0.leading.equalTo(self.returnDateLabel.snp.leading)
        }
        
        borrowButton.snp.makeConstraints {
            $0.top.equalTo(self.borrowContainerView.snp.top).offset(13.46)
            $0.leading.equalTo(self.borrowContainerView.snp.leading).offset(204)
            $0.trailing.equalTo(self.borrowContainerView.snp.trailing).offset(-26)
            $0.height.equalTo(54)
        }
    }
}
