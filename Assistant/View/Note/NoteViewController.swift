//
//  ViewController.swift
//  Assistant
//
//  Created by Максим Боталов on 01.09.2022.
//

import UIKit

class NoteViewController: UIViewController {
    
    var notesArray = NoteModel.arrayTest()
    
    // MARK: UI-element
    let noteTableView = UITableView(backgroundColor: .systemBackground)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupTableView()
        setupNavigationItem()
    }
}

// MARK: - Setup navigationItem
extension NoteViewController {
    func setupNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Изменить", style: .plain, target: self, action: #selector(editTableView))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus")!, style: .plain, target: self, action: #selector(newNote))
    }
    
    @objc private func newNote() {
        let vc = NewNoteViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func editTableView() {
        print(#function)
    }
}

// MARK: - Setup UITableView function
extension NoteViewController {
    private func setupTableView() {
        noteTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        noteTableView.dataSource = self
        noteTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension NoteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = notesArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = note.title
        config.secondaryText = note.date! + "  " + note.description!
        cell.contentConfiguration = config
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: nil) { _, _, _ in
            self.alertController(style: .actionSheet, title: nil, message: "Хотите удалить эту заметку? Заметка будет удалена со всех ваших устройств без возможности восстановления.", okayButton: "Удалить", okayButtonStyle: .destructive, cancelButton: "Отменить") {
                self.notesArray.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            } cancelCompletion: {
                tableView.reloadData()
            }
        }
        delete.image = UIImage(systemName: "trash.fill")
        delete.backgroundColor = .systemRed
        return UISwipeActionsConfiguration(actions: [delete])
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
