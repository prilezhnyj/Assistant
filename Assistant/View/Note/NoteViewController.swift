//
//  ViewController.swift
//  Assistant
//
//  Created by Максим Боталов on 01.09.2022.
//

import UIKit

class NoteViewController: UIViewController {
    
    let currentUser = UserModel(firstName: "Ирина", secondName: "Надымова", image: "photo")
    var notesArray = [NoteModel]()
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, NoteModel>
    typealias DataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, NoteModel>
    
    private var dataSource: DataSource!
    private var snapshot: DataSourceSnapshot!
    
    // MARK: UI-element
    var noteColletctionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .clear
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesArray.append(NoteModel(title: "Техническое задание №1", description: "Техническое описание заметки с элементами точного описание и дополнения", date: "20 декабря 2019 / 14:57"))
        notesArray.append(NoteModel(title: "Техническое задание №2", description: "Техническое описание заметки с элементами точного описание и дополнения", date: "20 декабря 2019 / 14:57"))
        notesArray.append(NoteModel(title: "Техническое задание №3", description: "Техническое описание заметки с элементами точного описание и дополнения", date: "20 декабря 2019 / 14:57"))
        
        setupConstraints()
        setupView()
        setupCollectionView()
        setupCollectioViewDataSource()
        setupSnapshot(for: notesArray)
    }
    
    // MARK: Configuring UICollectionView
    private func setupCollectionView() {
        noteColletctionView.register(NoteCollectionViewCell.self, forCellWithReuseIdentifier: NoteCollectionViewCell.cellID)
    }
    
    // MARK: Configuring UICollectionViewDiffableDataSource
    private func setupCollectioViewDataSource() {
        dataSource = DataSource(collectionView: noteColletctionView, cellProvider: { (collectionView, indexPath, userModel) -> NoteCollectionViewCell? in
            let section = Section(rawValue: indexPath.section)
            let note = self.notesArray[indexPath.row]

            switch section {
            case .note:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NoteCollectionViewCell.cellID, for: indexPath) as! NoteCollectionViewCell
                cell.configurationCell(for: note)
                return cell
            case .none:
                return nil
            }
        })
    }
    
    // MARK: Configuring NSDiffableDataSourceSnapshot
    private func setupSnapshot(for notes: [NoteModel]) {
        snapshot = DataSourceSnapshot()
        snapshot.appendSections([Section.note])
        snapshot.appendItems(notes)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    // MARK: Create CompositionalLayout
    static private func createLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(99))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

// MARK: - Setting up a custom NavigationBar
extension NoteViewController {
    private func setupView() {
        createCustomNavigationBar()
        
        let newNoteButton = createCustomButton(imageName: SystemIcon.add, selector: #selector(newNoteButtonTapped))
        let customTitleView = createCustomTitleView(userInfo: currentUser)
        
        navigationItem.rightBarButtonItem = newNoteButton
        navigationItem.titleView = customTitleView
    }
    
    @objc private func newNoteButtonTapped() {
        print(#function)
    }
}

// MARK: - Setting constraints
extension NoteViewController {
    private func setupConstraints() {
        view.addSubview(noteColletctionView)
        NSLayoutConstraint.activate([
            noteColletctionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteColletctionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            noteColletctionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            noteColletctionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
