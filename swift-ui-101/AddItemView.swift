//
//  AddItemView.swift
//  swift-ui-101
//
//  Created by SERRE Aurélien on 10/01/2024.
//

import SwiftUI

enum Rarity: CaseIterable {
    case common, uncommon, rare, epic, legendary, unique
}

struct AddItemView: View {
    @EnvironmentObject var inventory: Inventory
    @State var name: String = ""
    @State var rarity: Rarity = .common
    
    var body: some View {
           
            Form { // Wrapper de notre formulaire
                
                Section { // Correspond à une section du formulaire
                    TextField("Nom de l'objet", text: $name)
                    Picker("Rarete", selection: $rarity) {
                        ForEach(Rarity.allCases, id: \.self) { rarity in
                            Text(String(describing: rarity).capitalized)
                        }
                    }
                }
                
                Button {
                    inventory.addItem(item: "test")
                } label: {
                    HStack{
                        Image(systemName: "plus.app.fill")
                        Text("Ajouter")
                    }
                }


            }
        }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
