//
//  MyPageVC.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/14.
//

import UIKit
import SnapKit
import Then
import Moya

final class MyPageVC: UIViewController {
    
    // MARK: - Components
    /// 정은님이 만들어준 서브뷰 사용
    private let subView = SubView()
    private let settingBtn = UIButton().then {
        $0.setBackgroundImage(R.image.kyobo_icon_settings(), for: .normal)
    }
    
    private let userInfoView = UIView().then {
        $0.backgroundColor = .clear
    }
    
    private let userName = UILabel().then {
        $0.text = "짱짱짱짱 김담인님"
        $0.font = .kyoboIosBody1
        $0.textColor = Color.kybo_black
    }
    
    private let department = UILabel().then {
        $0.text = "경희대학교 소속"
        $0.font = .kyoboIosBody2
        $0.textColor = Color.kybo_gray
    }
    
    private let logoutBtn = UIButton().then {
        $0.layer.backgroundColor = UIColor.white.cgColor
        $0.layer.cornerRadius = 9
        $0.layer.shadowColor = UIColor.gray.cgColor
        $0.layer.shadowOpacity = 0.4
        $0.layer.shadowOffset = CGSize.zero
        $0.layer.shadowRadius = 3
        var config = UIButton.Configuration.plain()
        config.image = R.image.kyobo_icon_logout()
        /// 아이콘 이미지의 기본 크기가 있어서 일정 값 이상 적용 안됨 (한쪽으로 미는거는 가능 e.g. top만 10 주면 내려감)
        config.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        $0.configuration = config
    }
    // MARK: - Properties
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    let menuTitleList: [MyPageMenuList] = MyPageMenuList.titles
    var LendingData: UserLendingInfo?
    var userData : MyPageList?
    
    typealias Item = AnyHashable
    enum Sections: Int, CaseIterable, Hashable {
        case menuTitleList, detailList
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Sections, Item>! = nil
    
    private lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout()).then {
        $0.backgroundColor = Color.kybo_white
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.showsVerticalScrollIndicator = false
        $0.delegate = self
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setLayout()
        registerCells()
        setupDataSource()
        reloadData()
        requestData()
    }
    
    // MARK: - Function
    func registerCells() {
        collectionView.register(MyPageMenuCVC.self, forCellWithReuseIdentifier: MyPageMenuCVC.reuseID)
        collectionView.register(MyPageBorrowedListCVC.self, forCellWithReuseIdentifier: MyPageBorrowedListCVC.reuseID)
        collectionView.register(FilterHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FilterHeaderView.reuseID)
    }
}

// MARK: - Delegate
extension MyPageVC: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("컬렉션뷰 인덱스: \(indexPath)")
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageMenuCVC.reuseID, for: indexPath) as! MyPageMenuCVC
        cell.isSelected = true
        
    }
}
// MARK: - DiffableDataSource
extension MyPageVC {
    
    func setupDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Sections, Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let section = Sections(rawValue: indexPath.section)!
            switch section{
            case .menuTitleList:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageMenuCVC.reuseID, for: indexPath) as! MyPageMenuCVC
                /// 첫번째 셀 선택표시로 초기화 해주기 위해 index 파라미터로 받음
                cell.config(item as! MyPageMenuList, index: indexPath)
                return cell
            case .detailList:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyPageBorrowedListCVC.reuseID, for: indexPath) as! MyPageBorrowedListCVC
                cell.updateInfo(lendingInfo: item as? UserLendingInfo)
                return cell
            }
        })
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, Item>()
        defer {
            dataSource.apply(snapshot, animatingDifferences: true)
        }
        snapshot.appendSections([.menuTitleList, .detailList])
        snapshot.appendItems(menuTitleList, toSection: .menuTitleList)
        snapshot.appendItems([], toSection: .detailList)
        dataSource.supplementaryViewProvider = {
            (collectionView, kind, indexPath) in
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: FilterHeaderView.reuseID, for: indexPath) as? FilterHeaderView else {
                return UICollectionReusableView()}
            return header
        }
    }
    
    private func updateData(lendingInfo: [UserLendingInfo]) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(lendingInfo, toSection: .detailList)
        dataSource.apply(snapshot)
    }
}

// MARK: - CompositionalLayout
extension MyPageVC {
    
    func layout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = Sections(rawValue: sectionIndex)!
            switch section {
            case .menuTitleList:
                return self.menuTitleSection()
            case .detailList:
                return self.detailListSection()
            }
        }
        return layout
    }
    
    func menuTitleSection() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(60), heightDimension: .estimated(18))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(8), top: nil, trailing: .flexible(8), bottom: nil)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(16))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 5)
        //        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 0, trailing: spacing)
        //        group.interItemSpacing = .flexible(-16)
        let section = NSCollectionLayoutSection(group: group)
     
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 23, bottom: 0, trailing: 25)
        return section
    }
    
    func detailListSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(335), heightDimension: .estimated(140))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(8), top: .fixed(24), trailing: .flexible(8), bottom: .fixed(24))
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 5)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 23, trailing: 0)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind:UICollectionView.elementKindSectionHeader,alignment: .top)
        header.pinToVisibleBounds = true
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

// MARK: - Set UI
extension MyPageVC {
    private func setupViews() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = Color.kybo_white
        [subView, settingBtn, userInfoView, collectionView].forEach {
            view.addSubview($0)
        }
        
        [userName, department, logoutBtn].forEach {
            userInfoView.addSubview($0)
        }
        
    }
    
    private func setLayout() {
        subView.snp.makeConstraints {
            $0.leading.equalTo(safeArea)
            $0.trailing.equalToSuperview().inset(50)
            $0.top.equalToSuperview().offset(60)
            $0.height.equalTo(50)
        }
        
        settingBtn.snp.makeConstraints {
            $0.centerY.equalTo(subView)
            $0.leading.equalTo(subView.snp.trailing)
        }
        
        userInfoView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalToSuperview().inset(27)
            $0.top.equalTo(subView.snp.bottom).offset(17)
            $0.height.equalTo(48)
        }
        
        collectionView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalTo(userInfoView.snp.bottom).offset(35)
            $0.bottom.equalTo(safeArea)
        }
        
        ///  userInfoView
        userName.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview().offset(5)
        }
        
        department.snp.makeConstraints {
            $0.top.equalTo(userName.snp.bottom).offset(7)
            $0.leading.equalToSuperview()
        }
        
        logoutBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.height.equalTo(48)
        }
    }
}
// MARK: - Network
extension MyPageVC {
    func requestData(){
        MyPageAPI().dataProvider.request(.myDetailList) { response in
            switch response {
            case .success(let result):
                do{
                    let filteredResponse = try result.filterSuccessfulStatusCodes()
                    self.userData = try filteredResponse.map(MyPageList.self)
                    if let result = self.userData?.data{
                        self.updateData(lendingInfo: result.books )
                    }
                }catch(let error){
                    print("catch error :\(error.localizedDescription)")
                }
            case .failure(let error):
                print("failure :\(error.localizedDescription)")
            }
        }
    }
}
