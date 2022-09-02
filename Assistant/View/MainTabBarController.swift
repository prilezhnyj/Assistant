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
        let noteVC = creationNavigationController(viewController: NoteViewController(), title: "Заметки", nameImageItem: "pencil")
        let taskVC = creationNavigationController(viewController: TaskViewController(), title: "Задачи", nameImageItem: "list.dash")
        let settingVC = creationNavigationController(viewController: SettingViewController(), title: "Настройки", nameImageItem: "gear")
        viewControllers = [noteVC, taskVC, settingVC]
    }
    
    private func creationNavigationController(viewController: UIViewController, title: String, nameImageItem: String) -> UINavigationController {
        let item = UITabBarItem(title: title, image: UIImage(systemName: nameImageItem), tag: 0)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.title = title
        navigationController.tabBarItem = item
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}
