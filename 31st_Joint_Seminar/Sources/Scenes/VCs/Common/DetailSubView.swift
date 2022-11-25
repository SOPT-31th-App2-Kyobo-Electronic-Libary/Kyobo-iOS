import UIKit
import Then
import SnapKit

class DetailSubView : UIView{

    private lazy var backBtn = UIButton().then{
        $0.setImage(UIImage(named: "BookDetail/back"), for: .normal)
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
        self.addSubview(backBtn)
    }
    func setConstraints(){
        backBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(17)
            $0.width.height.equalTo(36)
        }
    }
}
