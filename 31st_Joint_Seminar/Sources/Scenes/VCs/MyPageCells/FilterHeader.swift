//
//  FilterCVC.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/25.
//

import UIKit
import SnapKit
import Then

final class FilterHeader: UICollectionReusableView {
    static var reuseID: String  = "FilterHeader"
    
    private lazy var filterStackView = UIStackView(arrangedSubviews: [emptyView, yearFilter, dateFilter]).then {
        $0.axis = .horizontal
        $0.alignment = .trailing
        $0.spacing = 8
    }
    
    private let emptyView = UIView()
    
    private let yearFilter = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.image = R.image.yearFilter_img()
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        $0.configuration = config
    }
    
    private let dateFilter = UIButton().then {
        var config = UIButton.Configuration.plain()
        config.image = R.image.lendingDate_img()
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 10, trailing: 5)
        $0.configuration = config
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
//        [yearFilter, dateFilter].forEach{
//            self.addSubview($0)
//        }
        self.addSubview(filterStackView)
    }
    
    func setLayout() {
//        dateFilter.snp.makeConstraints {
//            $0.directionalVerticalEdges.equalToSuperview()
//            $0.trailing.equalToSuperview().inset(25)
//            $0.width.equalTo(60)
//        }
//
//        yearFilter.snp.makeConstraints {
//            $0.directionalVerticalEdges.equalToSuperview()
//            $0.trailing.equalTo(dateFilter.snp.leading).inset(20)
//            $0.width.equalTo(65)
//        }
        
        filterStackView.snp.makeConstraints {
            $0.directionalVerticalEdges.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(25)
        }
    }
}
