//
//  SettingViewController.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

class SettingViewController: UIViewController {
    
    let myMax = UserModel(firstName: "Ирина", secondName: "Надымова", image: "photo")

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        view.backgroundColor = ColorSetup.background
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorSetup.white]
        
        setupView()
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
