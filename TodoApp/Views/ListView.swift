//
//  ListView.swift
//  TodoApp
//
//  Created by macOs on 3/12/2022.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel

    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
               NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeOut))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture(perform: {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            })
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List:")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                    NavigationLink("Add", destination: AddView())
            )
    }
    
                    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }.environmentObject(ListViewModel())
        
    }
}
