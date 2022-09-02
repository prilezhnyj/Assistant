//
//  ViewController.swift
//  Assistant
//
//  Created by Максим Боталов on 01.09.2022.
//

import UIKit

class NoteViewController: UIViewController {
    
    let myMax = UserModel(firstName: "Ирина", secondName: "Надымова", image: "photo")
    
    private let noteTableView = UITableView(backgroundColor: .clear)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupView()
        
        noteTableView.delegate = self
        noteTableView.dataSource = self
        noteTableView.register(NoteTableViewCell.self, forCellReuseIdentifier: NoteTableViewCell.cellID)
    }
    
    private func setupView() {
        createCustomNavigationBar()
    
        let newNoteButton = createCustomButton(imageName: SystemIcon.add, selector: #selector(newNoteButtonTapped))
        let customTitleView = createCustomTitleView(userInfo: myMax)
        
        navigationItem.rightBarButtonItem = newNoteButton
        navigationItem.titleView = customTitleView
    }
    
    @objc private func newNoteButtonTapped() {
        print(#function)
    }
}

extension NoteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.cellID, for: indexPath) as! NoteTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 124
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension NoteViewController {
    private func setupConstraints() {
        view.addSubview(noteTableView)
        NSLayoutConstraint.activate([
            noteTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            noteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            noteTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}
