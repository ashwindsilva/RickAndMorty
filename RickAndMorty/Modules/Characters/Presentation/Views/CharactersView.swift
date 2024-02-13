//
//  CharactersView.swift
//  RickAndMorty
//
//  Created by Ashwin D'Silva on 06/02/24.
//

import Combine
import UIKit

class CharactersView: UIView {
    
    private typealias DataSource = UICollectionViewDiffableDataSource<CharactersViewModel.Section, CharacterViewModel>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<CharactersViewModel.Section, CharacterViewModel>
    
    // MARK: - Properties
    
    private let viewModel: CharactersViewModel
    private var subscriptions: Set<AnyCancellable> = .init()
    private lazy var dataSource = makeDataSource()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeCollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Methods
    
    init(viewModel: CharactersViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupUI()
        setupBindings()
        configureCollectionView()
        
        viewModel.getCharacters()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(collectionView)
        activateCollectionViewConstraints()
    }
    
    private func activateCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func configureCollectionView() {
        collectionView.register(
            CharacterCollectionViewCell.self,
            forCellWithReuseIdentifier: CharacterCollectionViewCell.reuseIdentifier
        )
        
        collectionView.register(
            LoadingIndicatorReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: LoadingIndicatorReusableView.reuseIdentifier
        )
        
        collectionView.dataSource = dataSource
        collectionView.delegate = self
    }
    
    private func setupBindings() {
        let charactersHandler: ([CharacterViewModel]) -> Void = { [weak self] _ in
            self?.applySnapshot()
        }
        
        viewModel.$viewModels
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: charactersHandler)
            .store(in: &subscriptions)
    }
    
    private func makeCollectionViewLayout() -> UICollectionViewLayout {
        let padding:CGFloat = 16
        
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalWidth(0.5)
            )
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .estimated(300)
            ),
            subitems: [item]
        )
        group.interItemSpacing = .fixed(padding)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = padding
        section.contentInsets = NSDirectionalEdgeInsets(
            top: padding,
            leading: padding,
            bottom: padding,
            trailing: padding
        )
        
        if viewModel.isPaginationInProgress == true {
            let sectionFooter = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .estimated(20)
                ),
                elementKind: UICollectionView.elementKindSectionFooter,
                alignment: .bottom
            )
            section.boundarySupplementaryItems = [sectionFooter]
        }
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
    private func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: collectionView, cellProvider: characterCellProvider)
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            collectionView.dequeueReusableSupplementaryView(
                ofKind: UICollectionView.elementKindSectionFooter,
                withReuseIdentifier: LoadingIndicatorReusableView.reuseIdentifier,
                for: indexPath
            ) as? LoadingIndicatorReusableView
        }
        return dataSource
    }
    
    private func characterCellProvider(_ collectionView: UICollectionView, _ indexPath: IndexPath, _ characterViewModel: CharacterViewModel) -> CharacterCollectionViewCell? {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CharacterCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? CharacterCollectionViewCell else {
            fatalError("Failed to dequeue CharacterCollectionViewCell")
        }
        cell.configure(with: characterViewModel)
        
        return cell
    }
    
    private func applySnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.viewModels)
        
        dataSource.apply(snapshot, animatingDifferences: true)
    }
}

// MARK: - UICollectionViewDelegate

extension CharactersView: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let scrollViewHeight = scrollView.frame.height
        
        let didScrollToBottom = (offsetY + scrollViewHeight) >= contentHeight
        
        if didScrollToBottom {
            viewModel.getMoreCharactersIfNeeded()
        }
    }
}

//#Preview {
//    CharactersView(viewModel: .init())
//}
