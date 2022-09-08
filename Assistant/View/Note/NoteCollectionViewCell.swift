//
//  NoteTableViewCell.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

class NoteCollectionViewCell: UICollectionViewCell {
    
    static let cellID = "NoteCollectionViewCell"
    static let heightCell: CGFloat = 114
    
    private let titleText = UILabel(text: "Заголовок", textColor: ColorSetup.white, font: .boldSystemFont(ofSize: 20))
    private let descriptionText = UILabel(text: "Равным образом сложившаяся структура организации требуют.", textColor: ColorSetup.separator, font: .systemFont(ofSize: 15))
    private let dataNote = UILabel(text: "20 декабря 2019 / 14:57", textColor: ColorSetup.separator, font: .systemFont(ofSize: 12))
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorSetup.gray
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    // MARK: Required Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configurationCell(for note: NoteModel) {
        titleText.text = note.title
        descriptionText.text = note.description
        dataNote.text = note.date
    }
}

extension NoteCollectionViewCell {
    private func setupConstraints() {
        self.addSubview(titleText)
        NSLayoutConstraint.activate([
            titleText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            titleText.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            titleText.heightAnchor.constraint(equalToConstant: 22)])
        
        self.addSubview(descriptionText)
        NSLayoutConstraint.activate([
            descriptionText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            descriptionText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 4),
            descriptionText.heightAnchor.constraint(equalToConstant: 36)])
        
        self.addSubview(dataNote)
        NSLayoutConstraint.activate([
            dataNote.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            dataNote.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            dataNote.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 8),
            dataNote.heightAnchor.constraint(equalToConstant: 13)])
    }
}
