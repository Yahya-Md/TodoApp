//
//  ListRowView.swift
//  TodoApp
//
//  Created by macOs on 3/12/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isComplited ? "checkmark.circle" : "circle")
                .foregroundColor(item.isComplited ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical, 10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1: ItemModel = ItemModel(title: "First item!", isComplited: false)
    static var item2: ItemModel = ItemModel(title: "second item!", isComplited: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
                
        }.previewLayout(.sizeThatFits)
    }
}
