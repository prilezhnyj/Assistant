//
//  UserModel.swift
//  Assistant
//
//  Created by Максим Боталов on 02.09.2022.
//

import Foundation

struct UserModel: Hashable, Decodable {
    let firstName: String?
    let secondName: String?
    let image: String?
}
