//
//  ContentView.swift
//  RecycleMK
//
//  Created by John Yorke on 13/07/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import SwiftUI

struct RecyclableList : View {
    
    var recyclables: [Recyclable]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(RecyclableType.allCases.identified(by: \.self)) { type in
                    Section(header: Text(type.title), footer: self.footerText(for: type)) {
                        ForEach(Repo.recyclables(for: type)) { recyclable in
                            RecyclableRow(recyclable: recyclable)
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationBarTitle(Text("Recyclables"), displayMode: .large)
        }
    }
    
    func footerText(for type: RecyclableType) -> Text? {
        guard let note = type.note else { return nil }
        let string = "Tip: \(note)"
        return Text(string)
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RecyclableList(recyclables: Repo.recyclables)
                .environment(\.colorScheme, .dark)
            RecyclableList(recyclables: Repo.recyclables)
                .environment(\.colorScheme, .light)
        }
    }
}
#endif
