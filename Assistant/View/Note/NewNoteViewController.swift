//
//  NewNoteViewController.swift
//  Assistant
//
//  Created by Максим Боталов on 09.09.2022.
//

import UIKit

class NewNoteViewController: UIViewController {
    
    let titleLabel = UILabel(text: "Заголовок", textColor: .black, font: .systemFont(ofSize: 17))
    let descriptionLabel = UILabel(text: "Описание", textColor: .black, font: .systemFont(ofSize: 17))
    
    let titleTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 17)
        textView.layer.cornerRadius = 5
        textView.clipsToBounds = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новая заметка"
        view.backgroundColor = .systemBackground
        
        setupConstraints()
        setupNavigationItem()
        
//        descriptionTextView.tex
    }
}

// MARK: - Setup navigationItem
extension NewNoteViewController {
    func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cохранить", style: .plain, target: self, action: #selector(saveNote))
    }
    
    @objc private func saveNote() {
        print(#function)
    }
}

// MARK: - Setting constraints
extension NewNoteViewController {
    private func setupConstraints() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
        
        view.addSubview(titleTextField)
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
        
        view.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)])
        
        view.addSubview(descriptionTextView)
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
}
