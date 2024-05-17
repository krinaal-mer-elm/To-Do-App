//
//  ListViewModel.swift
//  To-Do App
//  
//  Created by elluminati on 16/05/24.
//

import Foundation

class ListViewModel : ObservableObject{
    
    
let itemsKey : String = "items_list"
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
init () {
        getItems()
    }
    
    func getItems(){
            guard
                let data1 = UserDefaults.standard.data(forKey: itemsKey),
                let savedItem = try? JSONDecoder().decode([ItemModel].self, from: data1)
        else { return }
        
        self.items = savedItem
    }
    
    func deletItem(indexset : IndexSet){
        items.remove(atOffsets: indexset)
    }
    func moveItem(from: IndexSet, to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func updateItem(item : ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateComplition()
        }
    }
    func saveItems(){
        if let encodedata = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedata, forKey: itemsKey)
        }
        
    }
    
    
}
