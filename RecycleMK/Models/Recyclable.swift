//
//  Recyclable.swift
//  RecycleMK
//
//  Created by John Yorke on 13/07/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import Foundation
import SwiftUI

struct Recyclable: Hashable, Codable, Identifiable {
    var id: Int {
        return title.hashValue
    }
    var title: String
    var note: String?
    var type: RecyclableType
}
