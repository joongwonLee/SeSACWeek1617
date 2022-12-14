//
//  NewsViewController.swift
//  SeSACWeek1617
//
//  Created by 이중원 on 2022/10/20.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var loadButton: UIButton!
    
    var viewModel = NewsViewModel()
    
    var dataSource: UICollectionViewDiffableDataSource<Int, News.NewsItem>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierachy()
        configureDataSource()
        bindData()
        //configureViews()
    }
    
    func bindData() {
//        viewModel.pageNumber.bind { value in
//            self.numberTextField.text = value
//        }
//
//        viewModel.sample.bind { item in
//            var snapshot = NSDiffableDataSourceSnapshot<Int, News.NewsItem>()
//            snapshot.appendSections([0])
//            snapshot.appendItems(item)
//            self.dataSource?.apply(snapshot, animatingDifferences: false)
//        }
        
//        viewModel.sample
//            .withUnretained(self)
//            .bind { (vc, item) in
//                var snapshot = NSDiffableDataSourceSnapshot<Int, News.NewsItem>()
//                snapshot.appendSections([0])
//                snapshot.appendItems(item)
//                self.dataSource?.apply(snapshot, animatingDifferences: false)
//            }
//
//        loadButton
//            .rx
//            .tap
//            .withUnretained(self)
//            .bind { (vc, _) in
//                vc.viewModel.
//            }
    }
    
//    func configureViews() {
//        numberTextField.addTarget(self, action: #selector(numberTextFieldChanged), for: .editingChanged)
//        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
//        loadButton.addTarget(self, action: #selector(loadButtonTapped), for: .touchUpInside)
//    }
//
//    @objc func numberTextFieldChanged() {
//        guard let text = numberTextField.text else { return }
//        viewModel.changeFormatPageNumberFormat(text: text)
//    }
//
//    @objc func resetButtonTapped() {
//        viewModel.resetSample()
//    }
//
//    @objc func loadButtonTapped() {
//        viewModel.loadSample()
//    }
    
}

extension NewsViewController {
    
    func configureHierachy() { //addSubView, init, snapkit
        collectionView.collectionViewLayout = createLayout()
        collectionView.backgroundColor = .lightGray
    }
    
    func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, News.NewsItem> { [self] cell, indexPath, itemIdentifier in
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.title
            content.secondaryText = itemIdentifier.body
            cell.contentConfiguration = content
            
            self.dataSource = UICollectionViewDiffableDataSource(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
                let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
                return cell
            })
        }
    }

    func createLayout() -> UICollectionViewLayout {
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        return layout
    }
    
}
