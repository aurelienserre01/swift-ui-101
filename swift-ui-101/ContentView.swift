//
//  ContentView.swift
//  swift-ui-101
//
//  Created by SERRE Aurélien on 10/01/2024.
//

import SwiftUI

class Inventory: ObservableObject  {
    @Published var loot = ["Epée", "Bouclier", "Armure"]
    
    func addItem(item: String) {
        loot.append(item)
    }
}

struct ContentView: View {
    @ObservedObject var inventory = Inventory()
    @State var addItemSheetPresented: Bool = false;
    
    func addItem() {
        inventory.loot.append("Magie de feu")
        }

    var body: some View {
        NavigationStack {
            List{
                Button("Ajouter un élément") {
                    addItem();
                }
                ForEach(inventory.loot, id: \.self){
                    item in
                    Text(item)
                }
            }
            .navigationBarTitle("Loot") // Notre titre de page, choisissez le titre que vous voulez
            .toolbar(content: { // La barre d'outil de notre page
                ToolbarItem(placement: ToolbarItemPlacement.automatic) {
                    Button(action: {
                        addItemSheetPresented.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                        Text("Ajouter")
                    })
                }
            })
            .sheet(isPresented: $addItemSheetPresented, content: {
                AddItemView().environmentObject(inventory)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
