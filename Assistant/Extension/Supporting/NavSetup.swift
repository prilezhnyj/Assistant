//
//  NavSetup.swift
//  Assistant
//
//  Created by Максим Боталов on 01.09.2022.
//

import UIKit

func navigationSetup(viewController: UIViewController) -> UINavigationController {
    let navVC = UINavigationController(rootViewController: viewController)
    navVC.navigationBar.prefersLargeTitles = true
    return navVC
}
