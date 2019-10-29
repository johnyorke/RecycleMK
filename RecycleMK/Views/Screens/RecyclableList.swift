//
//  ContentView.swift
//  RecycleMK
//
//  Created by John Yorke on 13/07/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import SwiftUI
import Intents

struct RecyclableList : View {
    
    var recyclables: [Recyclable]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(RecyclableType.allCases, id: \.self) { recyclableType in
                    Section(header: Text("\(recyclableType.emoji) \(recyclableType.title)"),
                            footer: self.footerText(for: recyclableType)) {
                                ForEach(Repo.recyclables(for: recyclableType)) { recyclable in
                                    RecyclableRow(recyclable: recyclable)
                                }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle(Text("Recyclables"), displayMode: .large)
            .onAppear {
                self.donateInteraction()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func footerText(for type: RecyclableType) -> Text? {
        guard let note = type.note else { return nil }
        let string = "Tip: \(note)"
        return Text(string)
    }

    func donateInteraction() {
        let intent = IsItRecyclableIntent()
        intent.suggestedInvocationPhrase = "Check recycling"
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate(completion: nil)
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
