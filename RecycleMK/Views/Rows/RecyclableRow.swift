//
//  RecyclableRow.swift
//  RecycleMK
//
//  Created by John Yorke on 13/07/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import SwiftUI

struct RecyclableRow : View {
    
    var recyclable: Recyclable
    
    var body: some View {
        VStack {
            HStack {
                Text(recyclable.title)
                    .font(.body)
                    .foregroundColor(.primary)
                Spacer()
            }
            HStack {
                subtitle(from: recyclable)
                    .font(.footnote)
                    .foregroundColor(.green)
                Spacer()
            }
        }
    }

    func subtitle(from recyclable: Recyclable) -> Text? {
        guard let recyclableNote = recyclable.note, recyclableNote.count > 0 else { return nil }
        return Text(recyclableNote)
    }
}

#if DEBUG
struct RecyclableRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RecyclableRow(recyclable: Repo.recyclables[0])
            RecyclableRow(recyclable: Repo.recyclables[6])
            }
            .previewLayout(.fixed(width: 200, height: 70))
    }
    
}
#endif
