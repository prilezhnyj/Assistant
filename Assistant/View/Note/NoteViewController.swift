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
    
    // MARK: UI-element
    let noteTableView = UITableView(backgroundColor: ColorSetup.background)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesArray.append(NoteModel(title: "Техническое задание №1", description: "Техническое описание заметки с элементами точного описание и дополнения", date: "20 декабря 2019 / 14:57"))
        notesArray.append(NoteModel(title: "Техническое задание №2", description: "Техническое описание заметки с элементами точного описание и дополнения", date: "20 декабря 2019 / 14:57"))
        notesArray.append(NoteModel(title: "Техническое задание №3", description: "Техническое описание заметки с элементами точного описание и дополнения", date: "20 декабря 2019 / 14:57"))
        
        noteTableView.register(NoteCollectionViewCell.self, forCellReuseIdentifier: NoteCollectionViewCell.cellID)
        noteTableView.dataSource = self
        noteTableView.delegate = self
        
        setupConstraints()
        setupView()
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension NoteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notesArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteCollectionViewCell.cellID, for: indexPath) as! NoteCollectionViewCell
        cell.configurationCell(for: note)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NoteCollectionViewCell.heightCell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: nil) { _, _, _ in
            self.notesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let edit = UIContextualAction(style: .destructive, title: nil) { _, _, _ in
            print(#function)
        }
        
        delete.backgroundColor = ColorSetup.background
        delete.image = UIImage(named: "delete")
        edit.backgroundColor = ColorSetup.background
        edit.image = UIImage(named: "edit")
        
        
        tableView.reloadData()
        return UISwipeActionsConfiguration(actions: [delete, edit])
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
        view.addSubview(noteTableView)
        NSLayoutConstraint.activate([
            noteTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noteTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
