//
//  MainTabBarController.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsTabBarControllers()
        
        tabBar.barTintColor = ColorSetup.background
        tabBar.tintColor = ColorSetup.pink
    }
    
    private func settingsTabBarControllers() {
        let noteVC = creationNavigationController(viewController: NoteViewController(), title: "Заметки", nameImageItem: "note")
        let taskVC = creationNavigationController(viewController: TaskViewController(), title: "Задачи", nameImageItem: "task")
        let settingVC = creationNavigationController(viewController: SettingViewController(), title: "Настройки", nameImageItem: "settings")
        viewControllers = [noteVC, taskVC, settingVC]
    }
    
    private func creationNavigationController(viewController: UIViewController, title: String, nameImageItem: String) -> UINavigationController {
        let item = UITabBarItem(title: title, image: UIImage(named: nameImageItem), tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.title = title
        viewController.view.backgroundColor = ColorSetup.background
        navigationController.tabBarItem = item
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ColorSetup.white]
        return navigationController
    }
}
