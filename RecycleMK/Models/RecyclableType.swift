//
//  RecyclableType.swift
//  RecycleMK
//
//  Created by John Yorke on 13/07/2019.
//  Copyright © 2019 John Yorke. All rights reserved.
//

import Foundation

enum RecyclableType: Int, CaseIterable, Hashable, Codable {

    case paperAndCardboard = 0
    case plasticBottles
    case cansAndTins
    case foodAndDrinkCartons
    
    var title: String {
        switch self {
        case .paperAndCardboard:
            return "Paper and Cardboard"
        case .plasticBottles:
            return "Plastic and Bottles"
        case .cansAndTins:
            return "Cans and Tins"
        case .foodAndDrinkCartons:
            return "Food and Drink Cartons"
        }
    }
    
    var note: String? {
        switch self {
        case .plasticBottles:
            return "Just wash, squash and put the lid back on."
        case .cansAndTins:
            return "Just rinse it out."
        case .foodAndDrinkCartons:
            return "These can sometimes called be \"Tetrapak\"."
        default:
            return nil
        }
    }
}
