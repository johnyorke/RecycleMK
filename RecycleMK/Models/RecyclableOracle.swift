//
//  RecyclableOracle.swift
//  RecycleMK
//
//  Created by John Yorke on 24/10/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import Foundation

struct RecyclableOracle {
    func isItemRecyclable(_ item: String) -> Recyclable? {
        return Repo.recyclables.first(where: { $0.title.contains(item) })
    }
}
