//
//  HomeVC.swift
//  31st_Joint_Seminar
//
//  Created by 김담인 on 2022/11/14.
//

import UIKit
import Then
import SnapKit
class HomeVC: UIViewController {
    var bookData : MainBooklist?
    var borrowData : LendingBook?
    var bestData : BestBook?
    var newData : NewBook?
    var category : Category?
    let newTitleList : [NewBookList] = NewBookList.title
    typealias Item = AnyHashable
    enum Sections : Int, CaseIterable,Hashable{
        case borrowList, bestList,newTitleList, newList, fieldList
    }
    var dataSource : UICollectionViewDiffableDataSource<Sections,Item>! = nil
    private lazy var subView = SubView(frame: self.view.bounds).then{
        $0.backgroundColor = Color.kybo_white
    }
    private lazy var collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: layout()).then{
        $0.backgroundColor = Color.kybo_white
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.delegate = self
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.kybo_white
        setViews()
        setConstraints()
        registerSubViews()
        setupDataSource()
        reloadData()
        borrowBook()
    }
    func registerSubViews(){
        collectionView.register(BorrowCell.self, forCellWithReuseIdentifier: BorrowCell.reuseId)
        collectionView.register(BestCell.self, forCellWithReuseIdentifier: BestCell.reuseId)
        collectionView.register(NewTitleListCell.self, forCellWithReuseIdentifier: NewTitleListCell.reuseId)
        collectionView.register(NewCell.self, forCellWithReuseIdentifier: NewCell.reuseId)
        collectionView.register(FieldCell.self, forCellWithReuseIdentifier: FieldCell.reuseId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.reuseId)
    }
    func setViews(){
        view.addSubview(subView)
        view.addSubview(collectionView)
    }
    func setConstraints(){
        subView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalToSuperview().offset(60)
            $0.height.equalTo(50)
        }
        collectionView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalTo(subView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
    func setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Sections,Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let section = Sections(rawValue: indexPath.section)!
            switch section{
            case .borrowList:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BorrowCell.reuseId, for: indexPath) as! BorrowCell
                cell.updateData(borrow: item as? LendingBook )
                return cell
            case .bestList :
                    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestCell.reuseId, for: indexPath) as! BestCell
                    cell.updateData( best: item as? BestBook)
                    return cell
            case .newTitleList :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewTitleListCell.reuseId, for: indexPath) as! NewTitleListCell
                cell.config((item as? NewBookList)!)
                return cell
            case .newList :
                        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewCell.reuseId, for: indexPath) as! NewCell
                cell.updateData( new: item as? NewBook)
                        return cell
            case .fieldList :
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FieldCell.reuseId, for: indexPath) as! FieldCell
                cell.updateData( category: item as? Category)
                return cell
            }
        })
    }
    private func reloadData(){
        var snapshot = NSDiffableDataSourceSnapshot<Sections,Item>()
        defer {
            dataSource.apply(snapshot, animatingDifferences: false)
        }
        snapshot.appendSections([.borrowList,.bestList,.newTitleList,.newList,.fieldList])
        snapshot.appendItems([],toSection: .borrowList)
        snapshot.appendItems([],toSection: .bestList)
        snapshot.appendItems(newTitleList,toSection: .newTitleList)
        snapshot.appendItems([],toSection: .newList)
        snapshot.appendItems([],toSection: .fieldList)
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else {return UICollectionReusableView()}
                if (indexPath.section == 0) {
                    header.HeaderTitle(title: "대출 도서목록")
                    header.BtnWithIcon(title: "더보기", icon: "")
                }else if (indexPath.section == 1){
                    header.HeaderTitle(title: "베스트 자료")
                    header.BtnWithIcon(title: "더보기",icon: "" )
                }else if(indexPath.section == 2){
                    header.HeaderTitle(title: "신착 자료")
                    header.BtnWithIcon(title: "더보기",icon: "")
                }else  if(indexPath.section == 4){
                    header.HeaderTitle(title: "분야별자료")
                    header.BtnWithIcon(title: "경영/경제" , icon: "Home/arrow")
                }
                return header
            } else {
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.reuseId, for: indexPath) as? FooterView else {return UICollectionReusableView()}
                return footer
            }
        }
    }
    private func updateData(borrow : [LendingBook],best:[BestBook],new :[NewBook],category :[Category]){
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(borrow,toSection: .borrowList)
        snapshot.appendItems(best,toSection: .bestList)
        snapshot.appendItems(new,toSection: .newList)
        snapshot.appendItems(category,toSection: .fieldList)
        dataSource.apply(snapshot)
    }

     func layout() -> UICollectionViewLayout{
         let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
             let section = Sections(rawValue: sectionIndex)!
             switch section {
             case .borrowList,.fieldList :
                 return self.normalSection()
             case .newTitleList :
                 return self.newTitleSection()
             case .newList :
                 return self.newSection()
             case .bestList :
                 return self.bestSection()
             }
         }
             return layout
         }
    
     func normalSection() -> NSCollectionLayoutSection{
         let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(92), heightDimension: .estimated(212))
         let item = NSCollectionLayoutItem(layoutSize: itemSize)
         let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(400),heightDimension: .estimated(212))
         let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
         let spacing = CGFloat(20)
         group.interItemSpacing = .fixed(spacing)
         let section = NSCollectionLayoutSection(group: group)
         section.interGroupSpacing = spacing
         section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
         section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: spacing, bottom: 50, trailing: spacing)
         let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
         let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind:UICollectionView.elementKindSectionHeader,alignment: .top)
         section.boundarySupplementaryItems = [header]
        return section
    }
    func newTitleSection() -> NSCollectionLayoutSection{
        let spacing = CGFloat(10)
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(56), heightDimension: .estimated(16))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .estimated(16))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 6)
        let section = NSCollectionLayoutSection(group: group)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
        section.boundarySupplementaryItems = [header]
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: spacing, bottom: 17, trailing: spacing)
       return section
    }
    func newSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(92), heightDimension: .estimated(212))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(400),heightDimension: .estimated(212))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let spacing = CGFloat(20)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize,elementKind: UICollectionView.elementKindSectionFooter,alignment: .bottom)
        section.boundarySupplementaryItems = [footer]
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: spacing, bottom: 20, trailing: spacing)
        return section
    }
     func bestSection() -> NSCollectionLayoutSection{
        let spacing = CGFloat(20)
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(220), heightDimension: .absolute(112))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(220), heightDimension: .absolute(240))
        let vgroup1 = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item , count: 2)
        vgroup1.interItemSpacing = .fixed(14)
        let vgroup2 = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item , count: 2)
        vgroup2.interItemSpacing = .fixed(14)
        let containerGroup =  NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .estimated(460), heightDimension: .absolute(240)), subitems: [vgroup1,vgroup2])
        containerGroup.interItemSpacing = .fixed(14)
        let section = NSCollectionLayoutSection(group: containerGroup)
        section.interGroupSpacing = spacing
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
         let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
         let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind: UICollectionView.elementKindSectionHeader,alignment: .top)
         section.boundarySupplementaryItems = [header]
         section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 40, trailing: spacing)
        return section
    }
}
extension HomeVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
extension HomeVC {
    func borrowBook(){
        MainAPI().bookProvider.request(.mainBookList) { response in
            switch response {
            case .success(let result):
                do{
                    let filteredResponse = try result.filterSuccessfulStatusCodes()
                    self.bookData = try filteredResponse.map(MainBooklist.self)
                    if let result = self.bookData?.data{
                        self.updateData(borrow: result.lendingBook, best: result.bestBook, new: result.newBook, category: result.categoryBook)
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
