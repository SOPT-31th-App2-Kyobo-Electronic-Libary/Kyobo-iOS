import UIKit
import Then
import SnapKit

class SearchSubView : UIView {

    private lazy var backBtn = UIButton().then {
        $0.setImage(UIImage(named:"LibrarySearch/back"), for: .normal)
        // $0.addTarget(self, action:#selector(touchupCloseButton), for:.touchUpInside)
    }
    private lazy var searchTextField = UITextField().then { // UISearchController
        $0.backgroundColor = Color.kybo_light_gray
        $0.font = .kyoboIosH4
        $0.layer.cornerRadius = 8
        $0.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 14.0, height: 0.0))
        $0.leftViewMode = .always
        $0.placeholder = "검색어를 입력해주세요" // color 설정 필요
    }
    private lazy var magnifyBtn = UIButton().then {
        $0.setImage(UIImage(named: "LibrarySearch/magnify"), for: .normal)
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
        [backBtn, searchTextField, magnifyBtn].forEach {
            self.addSubview($0)
        }
    }
    func setConstraints(){
        backBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(17)
            $0.width.height.equalTo(36)
        }
        searchTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.backBtn.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().offset(-75)
            $0.height.equalTo(36)
        }
        magnifyBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-29)
            $0.width.height.equalTo(36)
        }
    }
}
