//
//  ListRowView.swift
//  To-Do App
//
//  Created by elluminati on 14/05/24.
//

import SwiftUI

struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
     }
   }
}
struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "This is First Task!", isCompleted: false)
    static var item2 = ItemModel(title: "This is Second Task", isCompleted: true)
    static var item3 = ItemModel(title: "This is Third Task", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
            ListRowView(item: item3)
        }
        .previewLayout(.sizeThatFits)
    }
}
