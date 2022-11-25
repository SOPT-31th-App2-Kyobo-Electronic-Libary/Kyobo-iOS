import UIKit
import Then
import SnapKit

// MARK: - LibrarySearchVC

final class LibrarySearchVC: UIViewController {
    
    let recentList : [RecentModel] = RecentModel.recentList
    enum Section : Int, CaseIterable, Hashable {
        case main
    }
    var dataSource : UICollectionViewDiffableDataSource<Section,AnyHashable>! = nil
    
    // MARK: - UI Components
    
    private lazy var subView = SearchSubView(frame: self.view.bounds).then{
        $0.backgroundColor = Color.kybo_white
    }
    
    private lazy var collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createlayout()).then {
        $0.backgroundColor = Color.kybo_white
        $0.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        $0.register(RecentCell.self, forCellWithReuseIdentifier: RecentCell.reuseId)
    }
    
    private lazy var safeArea = self.view.safeAreaLayoutGuide
    
    private let recentSearchLabel = UILabel().then {
        $0.text = "최근 검색어"
        $0.font = .kyoboIosH5
        $0.textColor = Color.kybo_black
        $0.textAlignment = .center
    }
    
    private let deleteLabel = UILabel().then {
        $0.text = "전체삭제"
        $0.font = .kyoboIosH4
        $0.textColor = Color.kybo_gray
        $0.textAlignment = .center
    }
    
    private lazy var recentTitle1 = UIImageView().then {
        $0.image = UIImage(named: "LibrarySearch/recent_search_1")
    }
    
    private lazy var recentTitle2 = UIImageView().then {
        $0.image = UIImage(named: "LibrarySearch/recent_search_2")
    }
    
    private lazy var recentTitle3 = UIImageView().then {
        $0.image = UIImage(named: "LibrarySearch/recent_search_3")
    }
    
    private let recentSeenLabel = UILabel().then {
        $0.text = "최근 본 도서"
        $0.font = .kyoboIosH5
        $0.textColor = Color.kybo_black
        $0.textAlignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Color.kybo_white
        setViews()
        setConstraints()
        setupDataSource()
        reloadData()
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
            $0.top.equalTo(self.recentTitle3.snp.bottom).offset(28)
            $0.leading.equalTo(self.recentSearchLabel.snp.leading)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(self.recentSeenLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(7)
            $0.bottom.equalToSuperview()
        }
    }
}

extension LibrarySearchVC {
    func setupDataSource(){
       dataSource = UICollectionViewDiffableDataSource<Section,AnyHashable>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) in
           guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: RecentCell.reuseId,for : indexPath) as? RecentCell else {return UICollectionViewCell()}
                    cell.config(item as! RecentModel)
               return cell
       })
   }
    func createlayout() -> UICollectionViewCompositionalLayout {
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
       return UICollectionViewCompositionalLayout(section: section)
   }
   private func reloadData(){
       var snapShot = NSDiffableDataSourceSnapshot<Section,AnyHashable>()
       defer{
           dataSource.apply(snapShot,animatingDifferences: false)
       }
       snapShot.appendSections([.main])
       snapShot.appendItems(recentList,toSection: .main)
   }
}
extension LibrarySearchVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}
