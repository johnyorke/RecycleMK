//
//  ContentView.swift
//  WatchApp Extension
//
//  Created by John Yorke on 24/10/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach(sortedRecyclables()) { recyclable in
                RecyclableRow(recyclable: recyclable)
            }
        }
    }

    func sortedRecyclables() -> [Recyclable] {
        Repo.recyclables.sorted { (lhs, rhs) -> Bool in
            lhs.title < rhs.title
        }
    }
}

struct Watch_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
