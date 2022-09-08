//
//  NoteModel.swift
//  Assistant
//
//  Created by Максим Боталов on 08.09.2022.
//

import Foundation

struct NoteModel: Hashable, Decodable {
    let title: String?
    let description: String?
    let date: String?
}

enum Section: Int, CaseIterable {
    case note
}
