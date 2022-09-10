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
    
    static func arrayTest() -> [NoteModel] {
        var array = [NoteModel]()
        array.append(NoteModel(title: "Тестовый заголовок", description: "Тестовое описание и детали", date: "20.12.2018"))
        array.append(NoteModel(title: "Тестовый заголовок 2", description: "Тестовое описание и детали", date: "20.12.2018"))
        return array
    }
}
