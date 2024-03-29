//
//  Tabs.swift
//  RecycleMK
//
//  Created by John Yorke on 13/07/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import SwiftUI

struct Tabs : View {
    @State private var currentTab = 0
    
    var body: some View {
        TabView(selection: $currentTab) {
            RecyclableList(recyclables: Repo.recyclables)
                .tabItem {
                    Image(systemName: "arrow.2.circlepath")
                    Text("Recyclables")
            }.tag(0)

            SettingsList()
                .tabItem {
                    Image(systemName: "ellipsis")
                    Text("More")
            }.tag(1)
            
//            VisionView()
//                .tabItem {
//                    Image(systemName: "eye")
//                    Text("Live")
//            }.tag(1)
        }

        .accentColor(.green)
    }
}

#if DEBUG
struct Tabs_Previews : PreviewProvider {
    static var previews: some View {
        Tabs()
    }
}
#endif
