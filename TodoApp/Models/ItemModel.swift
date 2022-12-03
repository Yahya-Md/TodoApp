//
//  ItemModel.swift
//  TodoApp
//
//  Created by macOs on 3/12/2022.
//

import Foundation
import SwiftUI

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isComplited: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplited: Bool) {
        self.id = id
        self.title = title
        self.isComplited = isComplited
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title:title, isComplited: !isComplited)
    }
}
