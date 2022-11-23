//
//  NewTitleListCell.swift
//  31st_Joint_Seminar
//
//  Created by JEONGEUN KIM on 2022/11/19.
//

import UIKit
import Then
import SnapKit
class NewTitleListCell: UICollectionViewCell {
    static var reuseId : String = "NewTitleListCell"
    private var title = UILabel().then{
        $0.textAlignment = .center
        $0.textColor = Color.kybo_black
        $0.font  = .kyoboIosBody2
    }
    func config(_ item : NewBookList){
        self.title.text = item.title
    }
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setViews(){
        self.addSubview(title)
    }
    func setConstraints(){
        title.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
