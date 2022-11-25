import UIKit
import Then
import SnapKit

class LibrarySearchVC: UIViewController {
    var bookData : MainBooklist?
    var category : Category?
    typealias Item = AnyHashable
    enum Sections : Int, CaseIterable, Hashable{
        case fieldList
    }
    var dataSource : UICollectionViewDiffableDataSource<Sections,Item>! = nil
    private lazy var subView = SearchSubView(frame: self.view.bounds).then{
        $0.backgroundColor = Color.kybo_white
    }
    private lazy var collectionView = UICollectionView(frame: view.bounds,collectionViewLayout: layout()).then{
        $0.backgroundColor = Color.kybo_gray
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        $0.delegate = self
    }
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    private let recentSearchLabel = UILabel().then {
        $0.text = "최근 검색어"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = Color.kybo_black
        $0.textAlignment = .center
    }
    
    private let deleteLabel = UILabel().then {
        $0.text = "전체삭제"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
        $0.textColor = Color.kybo_gray
        $0.textAlignment = .center
    }
    
    private lazy var recentTitle1 = UIImageView().then {
        $0.image = UIImage(named: "recent_search_1")
    }
    
    private lazy var recentTitle2 = UIImageView().then {
        $0.image = UIImage(named: "recent_search_2")
    }
    
    private lazy var recentTitle3 = UIImageView().then {
        $0.image = UIImage(named: "recent_search_3")
    }
    
    private let recentSeenLabel = UILabel().then {
        $0.text = "최근 본 도서"
        $0.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.textColor = Color.kybo_black
        $0.textAlignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.kybo_white
        setViews()
        setConstraints()
        registerSubViews()
        setupDataSource()
        reloadData()
    }
    func registerSubViews(){
        collectionView.register(FieldCell.self, forCellWithReuseIdentifier: FieldCell.reuseId)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId)
        collectionView.register(FooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.reuseId)
    }
    func setViews(){
        [subView, collectionView, recentSearchLabel, deleteLabel, recentTitle1, recentTitle2, recentTitle3, recentSeenLabel].forEach {
            view.addSubview($0)
        }
    }
    func setConstraints(){
        subView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalToSuperview().offset(60)
            $0.height.equalTo(50)
        }
        recentSearchLabel.snp.makeConstraints {
            $0.top.equalTo(subView.snp.bottom).offset(15)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(27)
        }
        deleteLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.recentSearchLabel.snp.centerY)
            $0.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-27)
        }
        recentTitle1.snp.makeConstraints {
            $0.top.equalTo(self.recentSearchLabel.snp.bottom).offset(16)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(29)
            $0.height.equalTo(32)
            $0.width.equalTo(103)
        }
        recentTitle2.snp.makeConstraints {
            $0.top.equalTo(self.recentTitle1.snp.top)
            $0.leading.equalTo(self.recentTitle1.snp.trailing).offset(8)
            $0.height.equalTo(32)
            $0.width.equalTo(72)
        }
        recentTitle3.snp.makeConstraints {
            $0.top.equalTo(self.recentTitle1.snp.bottom).offset(8)
            $0.leading.equalTo(self.recentTitle1.snp.leading)
            $0.height.equalTo(32)
            $0.width.equalTo(211)
        }
        recentSeenLabel.snp.makeConstraints {
            $0.top.equalTo(recentTitle3.snp.bottom).offset(28)
            $0.leading.equalTo(recentSearchLabel.snp.leading)
        }
        collectionView.snp.makeConstraints {
            $0.directionalHorizontalEdges.equalTo(safeArea)
            $0.top.equalTo(self.recentSeenLabel.snp.bottom).offset(16)
            $0.bottom.equalToSuperview()
        }
    }
    func setupDataSource(){
        dataSource = UICollectionViewDiffableDataSource<Sections,Item>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let section = Sections(rawValue: indexPath.section)!
            switch section{
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
        snapshot.appendSections([.fieldList])
        snapshot.appendItems([],toSection: .fieldList)
        dataSource.supplementaryViewProvider = { (collectionView, kind, indexPath) in
            if kind == UICollectionView.elementKindSectionHeader {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.reuseId, for: indexPath) as? HeaderView else {return UICollectionReusableView()}
                return header
            } else {
                guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterView.reuseId, for: indexPath) as? FooterView else {return UICollectionReusableView()}
                return footer
            }
        }
    }
    private func updateData(category :[Category]){
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(category,toSection: .fieldList)
        dataSource.apply(snapshot)
    }

     func layout() -> UICollectionViewLayout{
         let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvirnment) -> NSCollectionLayoutSection? in
             let section = Sections(rawValue: sectionIndex)!
             switch section {
             case .fieldList :
                 return self.normalSection()
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
//         let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
//         let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,elementKind:UICollectionView.elementKindSectionHeader,alignment: .top)
//         section.boundarySupplementaryItems = [header]
        return section
    }
}
extension LibrarySearchVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
