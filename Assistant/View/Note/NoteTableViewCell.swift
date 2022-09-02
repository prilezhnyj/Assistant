//
//  NoteTableViewCell.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let cellID = "NoteTableViewCell"
    
    private let titleText = UILabel(text: "Заголовок", textColor: ColorSetup.white, font: .boldSystemFont(ofSize: 22))
    private let descriptionText = UILabel(text: "Равным образом сложившаяся структура организации требуют.", textColor: ColorSetup.separator, font: .systemFont(ofSize: 17))
    private let dataNote = UILabel(text: "20 декабря 2019 / 14:57", textColor: ColorSetup.separator, font: .systemFont(ofSize: 13))
    private let bgView = UIView(bgColor: ColorSetup.gray)
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = ColorSetup.background
        
        setupConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgView.layer.cornerRadius = 10
        bgView.clipsToBounds = true
    }
    
    // MARK: Required Init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension NoteTableViewCell {
    private func setupConstraints() {
        self.addSubview(bgView)
        NSLayoutConstraint.activate([
            bgView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            bgView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            bgView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4)])
        
        bgView.addSubview(titleText)
        NSLayoutConstraint.activate([
            titleText.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            titleText.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            titleText.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10),
            titleText.heightAnchor.constraint(equalToConstant: 24)])
        
        bgView.addSubview(descriptionText)
        NSLayoutConstraint.activate([
            descriptionText.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            descriptionText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 5),
            descriptionText.heightAnchor.constraint(equalToConstant: 41)])
        
        bgView.addSubview(dataNote)
        NSLayoutConstraint.activate([
            dataNote.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 16),
            dataNote.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -16),
            dataNote.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 10)])
    }
}
