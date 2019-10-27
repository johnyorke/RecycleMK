//
//  RecyclableOracle.swift
//  RecycleMK
//
//  Created by John Yorke on 24/10/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import Foundation

struct RecyclableOracle {
    static func isItemRecyclable(_ searchString: String) -> [Recyclable] {
        // check for exact match first
        if let exactMatch = Repo.recyclables.filter({ $0.title == searchString }).first {
            return [exactMatch]
        } else {
            var matchingItems = [Recyclable]()
            let words = searchString.split(separator: " ")
            for word in words {
                matchingItems.append(contentsOf: Repo.recyclables.filter({ $0.title.contains(word) || $0.note?.contains(word) ?? false }))
            }
            return Array(Set(matchingItems))
        }
    }
}

struct RecyclableOracleResponseBuilder {
    static func string(from recyclable: Recyclable) -> String {
        var string = "This item is recyclable in Milton Keynes."

        if let categoryNote = recyclable.type.note {
            string += " \(categoryNote)"
        }

        return string
    }

    static func nonRecyclableString() -> String {
        return "This item is not listed as a recyclable item in Milton Keynes. Remember; if in doubt, leave it out (and pop it in a black bin bag instead)."
    }
}
