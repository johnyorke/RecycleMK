//
//  SettingsList.swift
//  RecycleMK
//
//  Created by John Yorke on 28/10/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import SwiftUI
import Intents
import IntentsUI

struct SettingsList : View {

    var body: some View {
        NavigationView {
            List {
                Button(action: {
                    self.goToWebsite()
                }) {
                    HStack {
                        Text(verbatim: "Go to council website")
                        Spacer()
                        Image(systemName: "arrow.right")
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationBarTitle(Text("More"), displayMode: .large)
        }
    }

    func goToWebsite() {
        UIApplication.shared.open(URL(string: "https://www.milton-keynes.gov.uk/waste-recycling")!, options: [:], completionHandler: nil)
    }
}

#if DEBUG
struct SettinsPreview : PreviewProvider {
    static var previews: some View {
        Group {
            SettingsList()
        }
    }
}
#endif
