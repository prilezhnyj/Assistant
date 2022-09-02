//
//  UIViewController.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import UIKit

extension UIViewController {
    func createCustomNavigationBar() {
        navigationController?.navigationBar.barTintColor = ColorSetup.background
    }
    
    func createCustomTitleView(userInfo: UserModel) -> UIView {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 44)
        
        let userImage = UIImageView()
        userImage.image = UIImage(named: userInfo.image!)
        userImage.contentMode = .scaleAspectFill
        userImage.layer.cornerRadius = 18
        userImage.clipsToBounds = true
        userImage.frame = CGRect(x: 8, y: 2, width: 36, height: 36)
        view.addSubview(userImage)
        
        let fullName = UILabel()
        fullName.text = userInfo.firstName! + " " + userInfo.secondName!
        fullName.frame = CGRect(x: 55, y: 9.5, width: 250, height: 20)
        fullName.font = .systemFont(ofSize: 20)
        fullName.textColor = ColorSetup.white
        view.addSubview(fullName)
        
        return view
    }
    
    func createCustomButton(imageName: UIImage, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(image: imageName.withRenderingMode(.alwaysTemplate), colorImage: ColorSetup.pink, backgroundColor: .clear, isShadow: true)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        let barButtonItem = UIBarButtonItem(customView: button)
        return barButtonItem
    }
}
