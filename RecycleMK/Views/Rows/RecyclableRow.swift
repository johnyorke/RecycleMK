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
        HStack {
            VStack(alignment: .leading) {
                Text(recyclable.title)
                    .font(.body)
                    .foregroundColor(.green)
                    Text(recyclable.note ?? "")
                        .font(.footnote)
                        .lineLimit(Int.max)
                }
            Spacer()
            }
    }
}

#if DEBUG
struct RecyclableRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RecyclableRow(recyclable: Repo.recyclables[0])
            RecyclableRow(recyclable: Repo.recyclables[6])
            }
            .previewLayout(.fixed(width: 300, height: 70))
    }
    
}
#endif